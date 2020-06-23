import React, { useState } from 'react';
import CustomCard from '../components/Card';
import BookCover from '../images/book_cover.jpg';
import { useForm , Controller } from 'react-hook-form';
import { Form, Input, Button, Checkbox } from 'antd';
import { RHFInput } from 'react-hook-form-input';
import TextArea from 'antd/lib/input/TextArea';

function AddBookForm({addBook}) {
    
    const { handleSubmit, register, setValue, reset } = useForm();

    const onSubmit = (data) => {
        // After a form submit, we usually make an axios POST request to update
        // the backend. For the sake of simplicity, we only update our frontend.
        console.log(data);
        if(!data) return;
        addBook(
            {
                "title" : data.bookTitle , 
                "desc": data.bookDesc, 
                "img_url" : BookCover
            }
        )
    }

    return (
        <form style={{ 
                borderRadius: 10 , 
                marginTop: 10, 
                border: '2px solid black', 
                width: 400, paddingTop: 10 
            }} 
            onSubmit={handleSubmit(onSubmit)}>
            
            <p style={{ 
                color: 'white', 
                background: '#1DA57A', 
                borderBottom: '2px solid black', 
                width: 397,
                position: 'relative',
                bottom: 10,
                borderTopRightRadius: 10 ,
                borderTopLeftRadius: 10 , 
            }}>Book Form</p>
            
            <RHFInput as={
                <Form.Item label="Book Title: ">
                    <Input></Input>
                </Form.Item>
            }
            name="bookTitle"
            register={register}
            setValue={setValue}
            style={{ paddingLeft: 20 , paddingRight: 20 }}
            />
            
            <RHFInput as={
                <Form.Item label="Book Description: ">
                    <TextArea></TextArea>
                </Form.Item>
            }
            name="bookDesc"
            register={register}
            setValue={setValue}
            style={{ paddingLeft: 20 , paddingRight: 20 }}
            />
            
            <RHFInput as={
                <Form.Item>
                    <Button htmlType="submit" type="primary">+ Add Book</Button>
                </Form.Item>
            }
            name="bookDesc"
            register={register}
            setValue={setValue}
            />
        </form>
    )
}

function HooksContainer() {

    // Normally what'd we do here is call the componentDidMount lifecycle 
    // method which makes an axios GET request and fetches data
    // from the backend and uses it to update the state of the component
    // But for the sake of simplicity, we've hard-coded some book data here.

    const [books, updateBooks] = useState([
        {
            title: "Book 1",
            desc: "Book 1 Description",
            img_url: BookCover,
          },
          {
            title: "Book 2",
            desc: "Book 2 Description",
            img_url: BookCover,
          },
          {
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
            <CustomCard booksData={books}/>
            <AddBookForm addBook={addBook}/>
        </div>
    )

}

export default HooksContainer;