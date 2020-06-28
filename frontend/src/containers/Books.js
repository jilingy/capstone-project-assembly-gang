import React, { useState, useEffect } from 'react';
import CustomCard from '../components/Card';
import BookCover from '../images/book_cover.jpg';
import { useForm, Controller } from 'react-hook-form';
import { Form, Input, Button, Popover } from 'antd';
import axios from 'axios';

const { Search } = Input;

function AddBookForm({addBook}) {

    const { handleSubmit, errors, reset, control, defaultValues } = useForm({
        defaultValues: {
            "bookTitle" : '',
            "bookDesc" : '',
        },
    });

    const onSubmit = (data) => {
        // After a form submit, we usually make an axios POST request to update
        // the backend. For the sake of simplicity, we only update our frontend.
        console.log(data);
        if(!data) return;
        addBook(
            {
                book_details: [
                    {
                        "title"       : data.bookTitle , 
                        "description" : data.bookDesc, 
                        "image"       : BookCover
                    }
                ]
            }
        )
    }

    return (
        <div>
            <Popover
                placement="topLeft"
                content={
                    <form
                    style={{ width: 500 }} 
                    className="bookForm"
                    onSubmit={handleSubmit(onSubmit)}>
                    <Controller
                        name="bookTitle"
                        control={control}
                        rules={{ required: "Please enter a book title" }}
                        as={
                        <Form.Item
                            label="Book Title"
                            validateStatus={errors.bookTitle && "error"}
                            help={errors.bookTitle && errors.bookTitle.message}
                        >
                            <Input />
                        </Form.Item>
                        }
                        style={{ 
                            paddingLeft  : 20 , 
                            paddingRight : 20 
                        }}
                    />
    
                    <Controller
                        name="bookDesc"
                        control={control}
                        rules={{ required: "Please enter a description for the book" }}
                        as={
                        <Form.Item
                            label="Book Description"
                            validateStatus={errors.bookDesc && "error"}
                            help={errors.bookDesc && errors.bookDesc.message}
                        >
                            <Input />
                        </Form.Item>
                        }
                        style={{ 
                            paddingLeft  : 20 , 
                            paddingRight : 20 
                        }}
                    />
                    <Button type="primary" htmlType="submit">Submit</Button>
                    </form>
                    }
                    title="Book Form"
                    trigger="click"
                    arrowPointAtCenter={true}
                    >
                {/* <Button type="primary" style={{ right: 475, bottom: 73, position: 'relative' }}>+ Add Book</Button> */}
            </Popover>
        </div>
    )
}

export default function Books() {

    // Normally what'd we do here is call the componentDidMount lifecycle 
    // method which makes an axios GET request and fetches data
    // from the backend and uses it to update the state of the component
    // But for the sake of simplicity, we've hard-coded some book data here.

    // UPDATE: Since we've decided to use hooks, disregard the above.
    // All lifecycle methods have equivalent hooks. I suggest the team 
    // read up the Hooks API doc in the React documentation to fully 
    // understand how hooks replace lifecycle methods.

    const [books, updateBooks] = useState([])

    useEffect(() => {
        const fetchData = async() => {
            const result = await axios.get('http://127.0.0.1:8000/api/books/');
            updateBooks(result.data)
        }
        fetchData();
      } , []);

    const addBook = (book) => {
        const newBooks = [...books, book]
        updateBooks(newBooks);
    }   

    return (
        <div>
            <h1 style={{
                position: 'relative',
                right: 675,
                bottom: 25,
            }}>Main Collection</h1>
            <Search 
                placeholder="Search book by title, author, genre..." 
                onSearch={value => console.log(value)} 
                enterButton 
                style={{ 
                    position: 'relative',
                    width: 535, 
                    right: 260,
                    bottom: 73,
                }}
            />
            {/* We pass the 'addBook' function as a prop to the 'AddBookForm' component */}
            <AddBookForm addBook={addBook}/>
            {/* We pass the 'books' array as a prop to the 'CustomCard' component */}
            <CustomCard booksData={books}/>
        </div>
    )

}