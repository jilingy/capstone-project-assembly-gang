import React, { useEffect, useState } from 'react';
import { Card, Col, Row, Button, Popover, Select, message } from 'antd';
import BookCover from '../images/book_cover.jpg';
import { useForm, Controller } from 'react-hook-form';
import { connect } from 'react-redux';
import axios from 'axios';

const { Option } = Select;

function CustomCard(props) {

    const [collections, setCollections] = useState([]);

    const { handleSubmit, control } = useForm({});

    useEffect(() => {
        axios.get('http://127.0.0.1:8000/api/collections/')
            .then(res => {
                var filtered = res.data.filter(collection => {
                    if(parseInt(props.user_id) === collection.owner) {
                        return collection;
                    }
                })
                setCollections(filtered);
            })
    } , [])

    const addBookSuccess = () => {
        message.success('Book added to collection(s)!');
    };

    // Add book to collection(s) and increment 'Count' for collection
    const onSubmit = (data) => {
        data.selectedCollections.map(collection => {
            var split = collection.split(',');
            axios.post('http://127.0.0.1:8000/api/contains/' , {
                collection: parseInt(split[0]),
                book: parseInt(split[1]),
            })
            .then(res => {
                collections.map(collection => {
                    if(collection.id == parseInt(split[0])) {
                        axios.patch(`http://127.0.0.1:8000/api/collections/${split[0]}/` , {
                            count: collection.count + 1,
                        })
                        .then(res => {
                            console.log(res);
                        }).catch(err => {
                            console.log(err);
                        })
                    }
                })
            }).catch(err => {
                console.log(err);
            })
        })
    }

    return (
        <div className="site-card-wrapper" style={{ position: 'relative' , bottom: 50, left: -20}}>
            <Row gutter={16}>
            {
                props.booksData.map((book, index) => {
                    return (
                        <Col key={index}>
                            <Card 
                                title={book.book_title} 
                                bordered={true}
                                cover={<img alt="example" src={BookCover} />}
                                style={{ width: 300, height: 680, background: '#cfcdc6'}}
                                hoverable
                                extra={
                                    <Popover
                                        placement="topLeft"
                                        content={
                                            collections ?
                                                <form
                                                    onSubmit={handleSubmit(onSubmit)}
                                                >
                                                <Controller
                                                    name="selectedCollections"
                                                    control={control}
                                                    as={
                                                        <Select placeholder="Choose collection(s)" style={{ width: 250,paddingRight: 10 }} mode="multiple" allowClear={true}>
                                                            {collections.map(collection => {
                                                                return (
                                                                    <Option value={`${collection.id},${book.id}`}>{collection.collection_name}</Option>
                                                                )
                                                            })}
                                                        </Select>
                                                    }
                                                />
                                                    <Button onClick={addBookSuccess} type="primary" htmlType="submit">Submit</Button>
                                                </form> 
                                        : null}
                                        title="Add To Collection"
                                        trigger="click"
                                        arrowPointAtCenter={true}
                                    >
                                        <Button type="primary">+ Add</Button>
                                    </Popover>
                                }
                            >
                                <p><b>{book.book_publisher}</b></p>
                                <p><b>{book.publication_date}</b></p>
                                <p><b>{book.genre}</b></p>
                                {book.book_synopsis}                       
                            </Card>
                            <div style={{position: 'relative', bottom: 50 }}>
                                <Button type="primary" shape="round">View Details</Button>
                                {props.isFinished ? <Button style={{marginLeft: 25}} type="primary" shape="round">Add Review</Button> : null}
                            </div>
                        </Col>
                    )
                })
            }
            </Row>
        </div>
    )
}

const mapStateToProps = state => {
    return {
        user_id: state.user_id,
    }
}

export default connect(mapStateToProps)(CustomCard);