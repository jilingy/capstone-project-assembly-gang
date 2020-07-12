import React, { useEffect, useState } from 'react';
import { Card, Col, Row, Button, Popover, Select, message } from 'antd';
import BookCover from '../images/book_cover.jpg';
import { useForm, Controller } from 'react-hook-form';
import { connect } from 'react-redux';
import axios from 'axios';

const { Option } = Select;
const key = 'updatable';

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

    const removeBookSuccess = () => {
        message.loading({ content: 'Processing...', key });
            setTimeout(() => {
                // Trigger Books Component to re-render by running useEffect() after a 2 second timeout
                // which renders an alert message to the browser...
                message.warning({ content: 'Book removed from collection successfully!', key, duration: 2 });
                props.setBooks([]);
                props.setBookDelete(props.bookDelete + 1);
            }, 1000);
    };

    const handleDelete = (bookID , collectionID) => {
        axios.get('http://127.0.0.1:8000/api/contains/')
            .then(res => {
                    var objToDelete = res.data.filter(contain => {
                       if(contain.collection === collectionID && contain.book === bookID) {
                           return contain;
                       }
                    });
                    const triggerDelete = async() => {
                        axios.delete(`http://127.0.0.1:8000/api/contains/${objToDelete[0].id}`)
                            .then(res => {
                                removeBookSuccess();
                            }).catch(err => {
                                console.log(err);
                            })
                        }
                    triggerDelete();
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
                                    props.partOf ? 
                                        (<Popover
                                            placement="topLeft"
                                            content={
                                                collections ?
                                                <div>
                                                    <p>Are you sure you want to remove this book from this collection ?</p>
                                                    <Button onClick={() => handleDelete(book.id , props.collectionID)} type="danger">Confirm</Button>
                                                </div>
                                                : null}
                                            title="Remove From Collection ?"
                                            trigger="click"
                                            arrowPointAtCenter={true}
                                        >
                                            {props.partOf ? <Button type="danger">Remove</Button> : <Button type="primary">+ Add</Button>}
                                        </Popover>) : 
                                        (<Popover
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
                                            title="Add To Collection ?"
                                            trigger="click"
                                            arrowPointAtCenter={true}
                                        >
                                            {props.partOf ? <Button type="danger">Remove</Button> : <Button type="primary">+ Add</Button>}
                                        </Popover>)
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