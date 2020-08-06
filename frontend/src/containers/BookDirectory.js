import React, { useState, useEffect } from 'react';
import { apiBooks, apiWrittenBy, apiAuthors } from '../services/utilities/API';
import Fade from 'react-reveal/Fade';
import CustomCard from '../components/Card';
import { Input, Button, Dropdown, Menu, message, Typography } from 'antd';
import { connect } from 'react-redux';
const key = 'updatable';

const { Search } = Input;

function BookDirectory(props) {

    const [books, updateBooks] = useState([]);
    const [filter, setFilter] = useState('Title');
    const [cancel, setCancel] = useState(false);
    const [query, setQuery] = useState(undefined);
    const [writtenBy, updateWrittenBy] = useState([]);
    const [authors, setAuthors] = useState([]);
    const {Title} = Typography

    useEffect(() => {
        if(cancel === false) {
            updateBooks([]);
            updateWrittenBy([]);
            setAuthors([]);
            const getWrittenBy = () => {
                apiWrittenBy.getAll()
                    // Strictly creates a 1-1 mapping between book and corresponding author
                    .then(res => {
                        var bookIDs = []
                        res.data.map(dict => {
                            bookIDs.push(dict.book)
                        })
                        // Some hash map magic
                        var max_of_array = Math.max.apply(Math, bookIDs);
                        var min_of_array = Math.min.apply(Math, bookIDs);
                        bookIDs = []
                        for(var i = min_of_array; i < max_of_array + 1; i++) {
                            bookIDs[i] = 0;
                        }
                        res.data.map(dict => {
                            bookIDs[dict.book] = dict.author
                        })
                        res.data.map(dict => {
                            apiBooks.getSingle(dict.book)
                                .then(bookRes => {
                                    apiAuthors.getSingle(bookIDs[dict.book])
                                        .then(res => {
                                            updateBooks(prevBooks => [...prevBooks , bookRes.data])
                                            setAuthors(prevAuthors => [...prevAuthors , res.data]);
                                        })
                                })
                                .catch(err => {
                                    console.log(err);
                                })
                        })
                        updateWrittenBy(bookIDs);
                    })
            }
            getWrittenBy();
        } 
        execSearch();
      } , [query]);  

    const handleSelectedFilter = (filter) => {
        var temp = filter.item.props.value;
        setFilter(temp);
    }

    const setSearchFlag = (inputQuery) => {
        setCancel(true);
        setQuery(inputQuery);
    }

    const cancelSearch = () => {
        setQuery(undefined);
        setCancel(false);
    }

    const emptySearchError = () => {
        message.loading({ content: 'Processing...', key });
            setTimeout(() => {
                message.error({ content: 'Oops! We need a query to help you search. Please provide a keyword to get started!', key, duration: 5 });
            }, 1000);
    };

    const emptySearchReturn = () => {
        message.loading({ content: 'Processing...', key });
            setTimeout(() => {
                message.error({ content: 'Oops! Looks like we didn\'t find anything matching your query! Try again!', key, duration: 5 });
            }, 1000);
    };

    const execSearch = () => {
        if(query) {
                var queryMod = ''
                var fieldMod = ''
                var author_filtered = [];
                if(filter === "Title") {
                    var filtered = books.filter((book, index) => {
                        queryMod = query.toLowerCase();
                        fieldMod = book.book_title.toLowerCase();
                        if(fieldMod.includes(queryMod)) {
                            author_filtered.push(authors[index]);
                            return book;
                        } else {
                            return null;
                        }
                    })
                } else if(filter === "Genre") {
                    var filtered = books.filter((book, index) => {
                        queryMod = query.toLowerCase();
                        fieldMod = book.genre.toLowerCase();
                        if(fieldMod.includes(queryMod)) {
                            author_filtered.push(authors[index]);
                            return book;
                        } else {
                            return null;
                        }
                    })
                } else if(filter === "Publisher") {
                    var filtered = books.filter((book, index) => {
                        queryMod = query.toLowerCase();
                        fieldMod = book.book_publisher.toLowerCase();
                        if(fieldMod.includes(queryMod)) {
                            author_filtered.push(authors[index]);
                            return book;
                        } else {
                            return null;
                        }
                    })
                } else if(filter === "Author") {
                    var filtered = [];
                    author_filtered = authors.filter((author, index) => {
                        queryMod = query.toLowerCase();
                        fieldMod = author.author_name.toLowerCase();
                        if(fieldMod.includes(queryMod)) {
                            filtered.push(books[index]);
                            return author;
                        } else {
                            return null;
                        }
                    })
                }
            if(filtered && !filtered.length) {
                emptySearchReturn();
            } else {
                setAuthors(author_filtered);
                updateBooks(filtered);
            }
        } else if(query === ''){
            emptySearchError();
        }
    }

    const menu = (
        <Menu onClick={handleSelectedFilter}>
          <Menu.Item key="1" value="Title">
            Title
          </Menu.Item>
          <Menu.Item key="2" value="Author">
           Author
          </Menu.Item>
          <Menu.Item key="3" value="Genre">
            Genre
          </Menu.Item>
          <Menu.Item key="4" value="Publisher">
           Publisher
          </Menu.Item>
        </Menu>
      );

    return (
        <div>
            <div style={{ position: 'relative', height: 100, border: '2px solid black', background: `linear-gradient(#283048 , #859398)`}}>
                <Fade cascade>
                    <Title 
                        level={3} 
                        style={{
                            fontFamily:"Book Antiqua,Georgia,Times New Roman,serif",
                            position: 'relative',
                            right: 670,
                            fontSize: 50, 
                            color: 'white',
                            textAlign : "center", 
                        }}>Book Directory
                    </Title>
                    <p style={{ color: 'white', fontSize: 24, position: 'relative', bottom: 40, right: 670 }}>Browse through our books or...</p>
                    <Search 
                    placeholder="Search book by title, author, genre..." 
                    onSearch={value => setSearchFlag(value)} 
                    enterButton 
                    style={{ 
                        position: 'relative',
                        width: 535, 
                        right: 230,
                        bottom: 90,
                    }}
                    />
                </Fade>
                <Dropdown.Button overlay={menu} style={{ position: 'relative',
                    width: 535, 
                    bottom: 122,
                    left: 320
                }} type="primary"> 
                    {filter ? filter : 'Filters'}
                </Dropdown.Button>
                {/* We pass the 'books' array as a prop to the 'CustomCard' component */}
            </div>
                <Button 
                    type={cancel ? "danger" : "primary"}
                    style={
                        filter !== 'Publisher' ?
                        { 
                            position: 'relative',
                            left: 200,
                            bottom: 44
                        } : 
                        {
                            position: 'relative',
                            left: 220,
                            bottom: 44
                        }
                    }
                    onClick={cancelSearch}
                >Cancel</Button>
            <CustomCard partOf={false} booksData={books} authors={authors}/>
        </div>
    )
}

const mapStateToProps = state => {
    return {
        user_id: state.user_id,
    }
}

export default connect(mapStateToProps)(BookDirectory);