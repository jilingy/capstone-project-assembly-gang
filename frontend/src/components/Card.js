import React, { useEffect, useState } from 'react';
import { Card, Col, Row, Button, Popover, Select, message, Modal } from 'antd';
import BookCover from '../images/book_cover.jpg';
import BookDetail from '../containers/BookDetail';
import { useForm, Controller } from 'react-hook-form';
import { connect } from 'react-redux';
import Review from './Review';
import EditReview from './EditReview';
import _ from "lodash";

import { apiCollections, apiContains } from '../services/utilities/API';

const { Option } = Select;
const key = 'updatable';

function CustomCard(props) {

    const [collections, setCollections] = useState([]);
    const [modalVisible, updateModalVisible] = useState(false);
    const [visible, updateVisible] = useState(false);
    const [editVisible, updateEditVisible] = useState(false);
    const [loading, updateLoading] = useState(false);
    const [bookToReview , setBookToReview] = useState();
    const [theReview , setTheReview] = useState();
    const [bookToDetail , setBookToDetail] = useState();
    const [addedReview, setAddedReview] = useState(0);

    const { handleSubmit, control } = useForm({});

    useEffect(() => {
        apiCollections.getAll()
            .then(res => {
                var filtered = res.data.filter(collection => {
                    if(parseInt(props.user_id) === collection.owner) {
                        return collection;
                    } else {
                        return null;
                    }
                })
                setCollections(filtered);
            }).catch(err => {
                console.log(err);
            })
    } , [])

    const addBookSuccess = () => {
        message.loading({ content: 'Processing...', key });
            setTimeout(() => {
                // Trigger Books Component to re-render by running useEffect() after a 2 second timeout
                // which renders an alert message to the browser...
                message.success({ content: 'Book added to collection(s)!', key, duration: 2 });
            }, 1000);
    };

    const addBookError = () => {
        message.loading({ content: 'Processing...', key });
            setTimeout(() => {
                // Trigger Books Component to re-render by running useEffect() after a 2 second timeout
                // which renders an alert message to the browser...
                message.error({ content: 'Error! Please select at least one collection to add to!', key, duration: 2 });
            }, 1000);
    };

    // Add book to collection(s) and increment 'Count' for collection
    const onSubmit = (data) => {
        if(data.selectedCollections !== undefined) {
            data.selectedCollections.map(collection => {
                var split = collection.split(',');
                apiContains.post({
                    collection: parseInt(split[0]),
                    book: parseInt(split[1]),
                }).then(res => {
                    collections.map(collection => {
                        if(collection.id === parseInt(split[0])) {
                            apiCollections.patch(split[0] , {
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
        } else {
            addBookError();
        } 
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

    const markBookAsReadSuccess = () => {
        message.loading({ content: 'Processing...', key });
            setTimeout(() => {
                // Trigger Books Component to re-render by running useEffect() after a 2 second timeout
                // which renders an alert message to the browser...
                message.warning(
                    { 
                        content: 'Congrats on finishing this book! We\'ve conveniently added the book to your \'Finished\' collection list. Happy Reading!', 
                        key, 
                        duration: 5 
                    }
                );
                props.setBooks([]);
                props.setBookDelete(props.bookDelete + 1);
            }, 1000);
    };

    const handleDelete = (bookID , collectionID, MarkAsRead) => {
        apiContains.getAll()
            .then(res => {
                var objToDelete = res.data.filter(contain => {
                    if(contain.collection === collectionID && contain.book === bookID) {
                        return contain;
                    } else {
                        return null;
                    }
                });
                const triggerDelete = async() => {
                    apiContains.remove(objToDelete[0].id).then(res => {
                        if(MarkAsRead) {
                            markBookAsReadSuccess();
                            handleMarkAsRead(bookID, collectionID);
                        } else {
                            removeBookSuccess();
                        }
                    }).catch(err => {
                        console.log(err);
                    })
                }
                const updateCollectionCount = async() => {
                    apiCollections.getSingle(collectionID).then(res => {
                        apiCollections.patch(collectionID , {
                            count: res.data.count - 1,
                        }).catch(err => {
                            console.log(err);
                        })
                    }).catch(err => {
                        console.log(err);
                    })
                }
                triggerDelete();
                updateCollectionCount();
            })
    }

    const handleMarkAsRead = (bookID, collectionID) => {
        collections.filter(collection => {
            if(collection.collection_type === "Finished") {
                apiContains.post({
                    collection: collection.id,
                    book: bookID,
                })
                apiCollections.patch(collection.id , {
                    count: collection.count + 1,
                })
            } else {
                return null;
            }
        })
    }

    const handleAddReview = (book) => {
        setBookToReview(book);
        updateVisible(true);
    }
    
    const handleEditReview = (book) => {
        setBookToReview(book);
        if(findReview(book) != null){
            setTheReview(findReview(book));
        }
        updateEditVisible(true);
    }
    

    const showDetails = (book) => {
        setBookToDetail(book)
        updateModalVisible(true)
    }

    const checkIfReviewExists = (book) => {
        var exist = false;
        for(var i = 0; i < props.reviews.length; i++) {
            var rev = props.reviews[i];
            console.log(rev);
            if(rev.book === book.id) {
                exist = true; 
                
                break;
            }
        }
        return exist;
    }

    const findReview = (book) => {
        
        for(var i = 0; i < props.reviews.length; i++) {
            var rev = props.reviews[i];
            console.log(rev);
            if(rev.book === book.id) {
                return rev;
                
                break;
            }
        }
        return null;
    }


    return (
        <div className="site-card-wrapper" style={{ position: 'relative' , bottom: props.partOf ? 60 : -10, left: 215}}>
            <Row gutter={32}>
            {
                props.booksData.map((book, index) => {
                    var hasReview = props.reviews && checkIfReviewExists(book);
                    return (
                        <div>
                        <Col key={index}>
                            <Card 
                                title={book.book_title} 
                                bordered={true}
                                cover={<img alt="example" src={BookCover} />}
                                headStyle={{ color: 'white', background: `linear-gradient(#FFA17F , #00223E)` }}
                                style={{ width: 300, height: 600, background: '#cfcdc6', border: '2px solid black'}}
                                hoverable
                                extra={
                                    props.partOf ? 
                                        (<Popover
                                            className="popover-title"
                                            placement="topLeft"
                                            content={
                                                collections ?
                                                <div>
                                                    <p>Are you sure you want to remove this book from this collection ?</p>
                                                    <Button onClick={() => handleDelete(book.id , props.collectionID, false)} type="danger">Confirm</Button>
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
                                                                        collection.collection_type !== "Finished" ? <Option value={`${collection.id},${book.id}`}>{collection.collection_name}</Option> : null
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
                                            {props.publicAccess ? null : (props.partOf ? <Button type="danger">Remove</Button> : <Button type="primary">+ Add</Button>)}
                                        </Popover>)
                                }
                            >
                                {book.book_synopsis}                       
                            </Card>
                            {bookToDetail ?<BookDetail visible={modalVisible} updateModalVisible={updateModalVisible} {...bookToDetail} /> : null}
                            <Button style={{ position : 'relative', bottom: 50 }} type="primary" shape="round" onClick={(()=>showDetails(book))}>View Details</Button>
                            {props.partOf ? 
                                <Button 
                                    style={{ 
                                        position : 'relative', 
                                        bottom: 50, left: 5,
                                        color: hasReview ? 'black' : 'white'
                                    }} 
                                    type="primary" 
                                    shape="round"
                                    onClick={props.collection.collection_type !== "Finished" ? (() => handleDelete(book.id, props.collectionID, true)) :    (hasReview ? (() => handleEditReview(book)) : (() => handleAddReview(book)))}                                     
                                >
                                    {props.collection.collection_type === "Finished" ? (hasReview ? "Edit Review" : "Add Review") : "Mark As Read"}
                                </Button> 
                                    : 
                                null
                            }
                        </Col>
                        {bookToReview ? <Review visible={visible} updateVisible={updateVisible} book={bookToReview} loading={loading} updateLoading={updateLoading}/> : null}
                        {bookToReview ? <EditReview visible={editVisible} updateEditVisible={updateEditVisible} book={bookToReview} loading={loading} review={theReview} updateLoading={updateLoading}/> : null}
                        </div>
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