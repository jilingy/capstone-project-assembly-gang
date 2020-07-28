import React, { useState, useEffect } from 'react';
import CustomCard from '../components/Card';
import { Button, Alert, Typography } from 'antd';
import { Link } from 'react-router-dom';
import { connect } from 'react-redux';
import Fade from 'react-reveal/Fade';

import { apiCollections, apiBooks, apiContains, apiReviews } from '../services/utilities/API';

function Books(props) {

    // Normally what'd we do here is call the componentDidMount lifecycle 
    // method which makes an axios GET request and fetches data
    // from the backend and uses it to update the state of the component
    // But for the sake of simplicity, we've hard-coded some book data here.

    // UPDATE: Since we've decided to use hooks, disregard the above.
    // All lifecycle methods have equivalent hooks. I suggest the team 
    // read up the Hooks API doc in the React documentation to fully 
    // understand how hooks replace lifecycle methods.

    // UPDATE (26th June): As can be seen below, I've populated our 
    // backend with some dummy book data. Previously we made an axios
    // request to an external API, however, the code below has been
    // refactored to make a axios request to our API backend using 
    // hooks

    const collectionID = props.location.state.collectionID;
    const partOf = props.location.state.partOf;

    const publicProfile = props.location.state.profile;
    const publicAccess = props.location.state.publicAccess;

    const reviews = props.location.state.reviews;
    const [books, setBooks] = useState([])
    const [collection, setCollection] = useState()
    const [bookDelete, setBookDelete] = useState(0);

    const {Title} = Typography

    useEffect(() => {
        getCollection();
        getBooks();
      } , [bookDelete]);  

    const getCollection = () => {
        apiCollections.getSingle(collectionID).then(res => {
            setCollection(res.data);
        })
    }

    const getBooks = () => {
        apiContains.getAll()
            .then(res => {
                res.data.filter(contain => {
                    if(collectionID === contain.collection) {
                        apiBooks.getSingle(contain.book).then(res => {
                            addToBooks(res.data);
                        })
                    }
                })
            })
    }

    const addToBooks = (book) => {
        setBooks(prevBooks => [...prevBooks , book]);
    }

    return (
        <div style={{ paddingTop: publicAccess ? 0 : 0 }}>
            <div>
                {
                    publicAccess ? (
                        <div style= {{ paddingTop:50, height: 100, border: '2px solid black', background: `linear-gradient(#283048 , #859398)` }}>
                            <Fade cascade>
                                <Title 
                                    level={3}
                                    style={{
                                        position: 'relative',
                                        right: 370,
                                        bottom: 25,
                                        fontSize: 50, 
                                        color: 'white',
                                        textAlign : "center",
                                        fontFamily:"Book Antiqua,Georgia,Times New Roman,serif"
                                    }}
                                >{collection ? `${publicProfile.username}'s ${collection.collection_name}` : 'Search Results'}
                                </Title>
                            </Fade>
                        </div>
                    ) : (
                        <div style= {{ paddingTop:20, height: 100, border: '2px solid black', background: `linear-gradient(#283048 , #859398)` }}>
                            <Fade cascade>
                                <Title 
                                    level={3}
                                    style={{
                                        position: 'relative',
                                        right: 530,
                                        fontSize: 50, 
                                        color: 'white',
                                        textAlign : "center",
                                        fontFamily:"Book Antiqua,Georgia,Times New Roman,serif"
                                    }}
                                >{collection ? `${collection.collection_name}` : 'Search Results'}
                                </Title>
                            </Fade>
                        </div>
                    )
                }
            </div>
            <div style={{ paddingLeft: 110 }}>
                {
                    !publicAccess ? (
                        books.length === 0 ? <Link to="/col_list"><Button style={{
                            position: 'relative',
                            bottom: 60,
                            right: 310
                        }} 
                        type="primary"
                        >Back to Collections</Button></Link> : 
                        <div>
                            <Link to="/col_list">
                                <Button style={{
                                    position: 'relative',
                                    bottom: 60,
                                    right: 240
                                }} 
                                type="primary"
                                >Back to Collections
                                </Button>
                            </Link>
                            <Link to="/book_dir">
                                <Button style={{
                                    position: 'relative',
                                    bottom: 60,
                                    right: 230
                                }} 
                                type="primary">Add Books
                                </Button>
                            </Link>
                        </div>
                    ) : <Link to="/collections">
                            <Button style={{
                                position: 'relative',
                                bottom: 55,
                                left: 25,
                            }} 
                            type="primary">Back to Collections
                            </Button>
                        </Link>
                }
            </div>
            {
                books.length === 0 ? 
                    <div style={{ width: 1200, margin:'auto' }}>
                        {
                            (collection && collection.collection_type !== "Finished") ?
                                publicAccess ? (
                                    <Alert
                                        message="Hey there!"
                                        description={`Looks like ${publicProfile.username} is still working on their collection! Check back in later.`}
                                        type="info"
                                        showIcon
                                    />
                                ) : 
                                (
                                    <Alert
                                        message="Hey there!"
                                        description="Seems like you've got no books in this colleciton. Head over to the Book Directory to start adding some books!"
                                        type="info"
                                        showIcon
                                    /> 
                                ) : 
                                (
                                    <Alert
                                        message="Hey there!"
                                        description="This is your finished collection! Only books that have been marked as 'read' appear in here!"
                                        type="info"
                                        showIcon
                                    />
                                )
                        }
                        {
                            publicAccess ? null : ((collection && collection.collection_type !== "Finished") ? 
                                <Button 
                                    style={{ 
                                        position: 'relative', 
                                        left: 25, 
                                        top: 15 
                                    }} 
                                    type="primary">
                                        <Link to="/book_dir">Go To Book Directory</Link>
                                </Button> : null
                            )
                        }
                    </div>
                : 
                <div style={{ paddingTop: publicAccess ? 0 : 40 }}>
                    <CustomCard 
                    setBooks={setBooks} 
                    bookDelete={bookDelete} 
                    setBookDelete={setBookDelete} 
                    collectionID={collectionID}
                    collection={collection} 
                    partOf={partOf} 
                    booksData={books}
                    reviews={reviews}
                    publicAccess={publicAccess}
                />
                </div>
            }            
        </div>
    )

}

const mapStateToProps = state => {
    return {
        user_id: state.user_id,
    }
}

export default connect(mapStateToProps)(Books);