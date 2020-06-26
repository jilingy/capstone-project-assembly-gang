import React, { useState } from 'react';
import CustomCard from '../components/Card';
import BookCover from '../images/book_cover.jpg';
import { useForm, Controller } from 'react-hook-form';
import { Form, Input, Button, Popover } from 'antd';

function AddBookForm({addBook}) {

    const { handleSubmit, errors, reset, control, defaultValues } = useForm({
        defaultValues: {
            "bookTitle" : '',
            "bookDesc" : '',
        },
    });

    // useEffect(() => {
    //     reset({defaultValues});
    // } , [defaultValues])

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
            <Popover
                placement="topLeft"
                style={{color: '#1DA57A'}}
                content={
                    <form 
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
            >
                <Button type="primary" style={{ marginTop: 15, left: 790, bottom: 440 }}>+ Add Book</Button>
            </Popover>
        </div>
    )
}

export default function Books() {

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