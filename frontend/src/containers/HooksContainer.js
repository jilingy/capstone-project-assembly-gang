import React, { useState } from 'react';
import CustomCard from '../components/Card';
import BookCover from '../images/book_cover.jpg';
import { useForm, Controller } from 'react-hook-form';
import { Form, Input, Button } from 'antd';

function AddBookForm({addBook}) {
    
    const { handleSubmit, errors, reset, control } = useForm({});

    const onSubmit = (data) => {
        // After a form submit, we usually make an axios POST request to update
        // the backend. For the sake of simplicity, we only update our frontend.
        console.log(data);
        if(!data) return;
        addBook(
            {
                "title"   : data.bookTitle , 
                "desc"    : data.bookDesc, 
                "img_url" : BookCover
            }
        )
    }

    return (
        <div>
            <p>
                The form below example of a standard form implemented using React Hooks. We make 
                use of a handy wrapper utility called 'RHFInput' that allows us to use hooks with 
                Antd form components. Inspect the relevant code.
            </p>
            <form style={{ 
                    borderRadius : 10 , 
                    marginTop    : 10, 
                    border       : '2px solid black', 
                    width        : 500, 
                    paddingTop   : 10 ,
                    paddingBottom: 10,
                }} 
                className="bookForm"
                onSubmit={handleSubmit(onSubmit)}>
                <p style={{ 
                    color                : 'white', 
                    background           : '#1DA57A', 
                    borderBottom         : '2px solid black', 
                    width                : 496,
                    position             : 'relative',
                    bottom               : 10,
                    borderTopRightRadius : 10 ,
                    borderTopLeftRadius  : 10 , 
                }}>Book Form</p>
                
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

                <Button type="primary" htmlType="submit" onClick={reset}>Submit</Button>
                
            </form>
        </div>
    )
}

export default function HooksContainer() {

    // Normally what'd we do here is call the componentDidMount lifecycle 
    // method which makes an axios GET request and fetches data
    // from the backend and uses it to update the state of the component
    // But for the sake of simplicity, we've hard-coded some book data here.

    const [books, updateBooks] = useState([
        {
            id: 1,
            title: "Book 1",
            desc: "Book 1 Description",
            img_url: BookCover,
          },
          {
            id: 2,
            title: "Book 2",
            desc: "Book 2 Description",
            img_url: BookCover,
          },
          {
            id: 3,
            title: "Book 3",
            desc: "Book 3 Description",
            img_url: BookCover,
          },
    ])

    const addBook = (book) => {
        const newBooks = [...books, book]
        updateBooks(newBooks);
    }   

    return (
        <div>
            {/* We pass the 'books' array as a prop to the 'CustomCard' component */}
            <CustomCard booksData={books}/>
            {/* We pass the 'addBook' function as a prop to the 'AddBookForm' component */}
            <AddBookForm addBook={addBook}/>
        </div>
    )

}