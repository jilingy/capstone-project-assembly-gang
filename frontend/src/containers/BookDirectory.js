import React, { useState, useEffect } from 'react';
import CustomCard from '../components/Card';
import { Input, Button, Dropdown, Menu } from 'antd';
import axios from 'axios';
import { connect } from 'react-redux';

const { Search } = Input;

function BookDirectory(props) {

    const [books, updateBooks] = useState([]);
    const [filteredBooks, setFilteredBooks] = useState([]);
    const [filter, setFilter] = useState('');
    const [search, ranSearch] = useState(false);
    const [query, setQuery] = useState('');

    useEffect(() => {
        const fetchSearchData = async() => {
            const result = await axios.get('http://127.0.0.1:8000/api/books/');
            updateBooks(result.data);
        }
        if(search === false) {
            fetchSearchData();
        } else {
            execSearch();
        }
      } , [search]);  

    const handleSelectedFilter = (filter) => {
        var temp = filter.item.props.value;
        setFilter(temp);
    }

    const setSearchFlag = (inputQuery, flag) => {
        setQuery(inputQuery);
        ranSearch(flag);
    }

    const execSearch = () => {
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
        if(filtered.length > 0) {
            setFilteredBooks(filtered);
        } else {
            setFilteredBooks([]);
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
            }}>{search ? 'Search Results' : 'Book Directory'}</h1>
            <Search 
                placeholder="Search book by title, author, genre..." 
                onSearch={value => setSearchFlag(value, true)} 
                enterButton 
                style={{ 
                    position: 'relative',
                    width: 535, 
                    right: 210,
                    bottom: 70,
                }}
            />
            <Dropdown.Button overlay={menu} style={{ bottom: 70, right: 200}} type="primary"> 
                {filter ? filter : 'Filters'}
            </Dropdown.Button>
            <Button style={{
                bottom: 70,
                right: 190,
            }} 
            type={search ? "danger" : "primary"}
            onClick={(value) => setSearchFlag(value, false)}
            >Cancel</Button>
            {/* We pass the 'books' array as a prop to the 'CustomCard' component */}
            <CustomCard partOf={false} booksData={search ? filteredBooks : books}/>
        </div>
    )
}

const mapStateToProps = state => {
    return {
        user_id: state.user_id,
    }
}

export default connect(mapStateToProps)(BookDirectory);