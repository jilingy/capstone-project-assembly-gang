import React, { useState, useEffect } from 'react';
import CustomCard from '../components/Card';
import { Button, Alert } from 'antd';
import { Link } from 'react-router-dom';
import { connect } from 'react-redux'

import { apiCollections, apiBooks, apiContains } from '../services/utilities/API';

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
    const [books, setBooks] = useState([])
    const [collection, setCollection] = useState()
    const [bookDelete, setBookDelete] = useState(0);

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
        setBooks(prevBooks => ([...prevBooks , book]));
    }

    return (
        <div>
            <h1 style={{
                position: 'relative',
                right: 660,
                bottom: 25,
            }}>{collection ? collection.collection_name : 'Search Results'}</h1>
            
            {books.length === 0 ? <Link to="/col_list"><Button style={{
                bottom: 73,
                right: 410
            }} 
            type="primary"
            >Back to Collections</Button></Link> : <Link to="/col_list"><Button style={{
                position: 'relative',
                bottom: 73,
                right: 360
            }} 
            type="primary"
            >Back to Collections</Button></Link>}

            {books.length > 0 ? <Link to="/book_dir"><Button style={{
                position: 'relative',
                bottom: 73,
                right: 350
            }} 
            type="primary"
            >Add Books</Button></Link> : null}
            {
                books.length === 0 ? 
                    <div>
                        {
                            (collection && collection.collection_type !== "Finished") ? 
                                <Alert
                                    message="Hey there!"
                                    description="Seems like you've got no books in this colleciton. Head over to the Book Directory to start adding some books!"
                                    type="info"
                                    showIcon
                                /> : 
                                <Alert
                                    message="Hey there!"
                                    description="This is your finished collection! Only books that have been marked as 'read' appear in here!"
                                    type="info"
                                    showIcon
                                />
                        }
                        {(collection && collection.collection_type !== "Finished") ? <Button style={{ position: 'relative', left: 25, top: 15 }} type="primary"><Link to="/book_dir">Go To Book Directory</Link></Button> : null}
                    </div>
                : 
                <CustomCard 
                    setBooks={setBooks} 
                    bookDelete={bookDelete} 
                    setBookDelete={setBookDelete} 
                    collectionID={collectionID}
                    collection={collection} 
                    partOf={partOf} 
                    booksData={books} 
                />
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