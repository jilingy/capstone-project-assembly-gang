import React, { useState , useEffect } from 'react';
import CustomCard from '../components/Card';
import BookCover from '../images/book_cover.jpg';
import { useForm, ErrorMessage } from 'react-hook-form';
import { Alert, Form, Input, Button } from 'antd';
import { RHFInput } from 'react-hook-form-input';
import TextArea from 'antd/lib/input/TextArea';

function AddBookForm({addBook}) {
    
    const { handleSubmit, register, setValue, errors, reset } = useForm({});

    useEffect(() => {
        // We use the useEffect hook to apply validation filters to the inputs
        register({ name : 'bookTitle'} , { required: 'Please enter a book title!'});
        register({ name : 'bookDesc' } , { required: 'Please enter a description for the book!'});
    } , [])

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
                    borderRadius: 10 , 
                    marginTop   : 10, 
                    border      : '2px solid black', 
                    width       : 500, 
                    paddingTop  : 10 
                }} 
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
                
                <RHFInput as={
                    <Form.Item label="Book Title: ">
                        <Input></Input>
                    </Form.Item>
                }
                name="bookTitle"
                register={register}
                setValue={setValue}
                style={{ 
                    paddingLeft  : 20 , 
                    paddingRight : 20 
                }}
                />
                <ErrorMessage errors={errors} name="bookTitle">
                    {({ message }) => <Alert style={{ position: 'relative', bottom: 10, marginBottom: 10 }} message="Error" description={message} type="error" showIcon/>}
                </ErrorMessage>
                
                <RHFInput as={
                    <Form.Item label="Book Description: ">
                        <TextArea></TextArea>
                    </Form.Item>
                }
                name="bookDesc"
                register={register}
                setValue={setValue}
                style={{ 
                    paddingLeft  : 20, 
                    paddingRight : 20 
                }}
                />
                <ErrorMessage errors={errors} name="bookDesc">
                    {({ message }) => <Alert style={{ position: 'relative', bottom: 10, marginBottom: 10 }} message="Error" description={message} type="error" showIcon/>}
                </ErrorMessage>
                
                <RHFInput as={
                    <Form.Item>
                        <Button htmlType="submit" type="primary">+ Add Book</Button>
                    </Form.Item>
                }
                name="formSubmit"
                register={register}
                setValue={setValue}
                />
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
            {/* We pass the 'books' array as a prop to the 'CustomCard' component */}
            <CustomCard booksData={books}/>
            {/* We pass the 'addBook' function as a prop to the 'AddBookForm' component */}
            <AddBookForm addBook={addBook}/>
        </div>
    )

}