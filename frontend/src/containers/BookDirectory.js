import React, { useState, useEffect } from 'react';
import CustomCard from '../components/Card';
import { Input, Button, Dropdown, Menu, message } from 'antd';
import axios from 'axios';
import { connect } from 'react-redux';
const key = 'updatable';

const { Search } = Input;

function BookDirectory(props) {

    const [books, updateBooks] = useState([]);
    const [filter, setFilter] = useState('Title');
    const [cancel, setCancel] = useState(false);
    const [query, setQuery] = useState(undefined);

    useEffect(() => {
        if(cancel === false) {
            axios.get('http://127.0.0.1:8000/api/books/')
                .then(res => {
                    updateBooks(res.data);
                });
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
            var filtered = books.filter(book => {
                var queryMod = ''
                var fieldMod = ''
                if(filter === "Title") {
                    queryMod = query.toLowerCase();
                    fieldMod = book.book_title.toLowerCase();
                    if(fieldMod.includes(queryMod)) {
                        return book;
                    } else {
                        return null;
                    }
                } else if(filter === "Genre") {
                    queryMod = query.toLowerCase();
                    fieldMod = book.genre.toLowerCase();
                    if(fieldMod.includes(queryMod)) {
                        return book;
                    } else {
                        return null;
                    }
                } else if(filter === "Publisher") {
                    queryMod = query.toLowerCase();
                    fieldMod = book.book_publisher.toLowerCase();
                    if(fieldMod.includes(queryMod)) {
                        return book;
                    } else {
                        return null;
                    }
                }
            })
            if(filtered && !filtered.length) {
                emptySearchReturn();
            } else {
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
          <Menu.Item key="2" value="Genre">
            Genre
          </Menu.Item>
          <Menu.Item key="3" value="Publisher">
           Publisher
          </Menu.Item>
        </Menu>
      );

    return (
        <div>
            <h1 style={{
                position: 'relative',
                right: 710,
                bottom: 25,
            }}>{'Book Directory'}</h1>
            <Search 
                placeholder="Search book by title, author, genre..." 
                onSearch={value => setSearchFlag(value)} 
                enterButton 
                style={{ 
                    position: 'relative',
                    width: 535, 
                    right: 210,
                    bottom: 70,
                }}
            />
            <Button 
                type={cancel ? "danger" : "primary"}
                style={
                    filter !== 'Publisher' ?
                    { 
                        bottom: 70,
                        right: 100,
                    } : 
                    {
                        bottom: 70,
                        right: 80,
                    }
                }
                onClick={cancelSearch}
            >Cancel</Button>
            <Dropdown.Button overlay={menu} style={{ position: 'relative', bottom: 70, right: 280}} type="primary"> 
                {filter ? filter : 'Filters'}
            </Dropdown.Button>
            {/* We pass the 'books' array as a prop to the 'CustomCard' component */}
            <CustomCard partOf={false} booksData={books}/>
        </div>
    )
}

const mapStateToProps = state => {
    return {
        user_id: state.user_id,
    }
}

export default connect(mapStateToProps)(BookDirectory);