import React, { useState } from 'react';
import { List, Avatar } from 'antd';
import { Link } from 'react-router-dom';
import { useForm, Controller } from 'react-hook-form';
import { Form, Input, Button, Popover } from 'antd';
import CollectionListBookCover from '../images/books.svg';

function AddCollectionForm({addCollection}) {

    const { handleSubmit, errors, reset, control, defaultValues } = useForm({
        defaultValues: {
            "collectionTitle" : '',
            "collectionDesc" : '',
        },
    });

    const onSubmit = (data) => {
        // After a form submit, we usually make an axios POST request to update
        // the backend. For the sake of simplicity, we only update our frontend.
        console.log(data);
        if(!data) return;
        addCollection(
            {
                "title"       : data.collectionTitle, 
                "description" : data.collectionDesc, 
                "image"       : CollectionListBookCover,
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
                        name="collectionTitle"
                        control={control}
                        rules={{ required: "Please enter a collection title" }}
                        as={
                        <Form.Item
                            label="Collection Title"
                            validateStatus={errors.collectionTitle && "error"}
                            help={errors.collectionTitle && errors.collectionTitle.message}
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
                        name="collectionDesc"
                        control={control}
                        rules={{ required: "Please enter a description for the collection" }}
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
                    title="Create New Collection"
                    trigger="click"
                    arrowPointAtCenter={true}
                    >
                <Button type="primary" style={{ left: 770, bottom: 80, position: 'relative' }}>+ Add Collection</Button>
            </Popover>
        </div>
    )
}

export default function CollectionList() {

    const [collections, updateCollections] = useState([
        {
            title: 'Main Collection',
            description: 'Default list provided by the platform to all users',
        },
        {
            title: 'Finished Collection',
            description: "List of books marked 'Read' by user",
        }
    ]);

    const addCollection = (collection) => {
        const newCollection = [...collections, collection]
        updateCollections(newCollection);
    } 

    return (
        <div>
            <h1 style={{
                position: 'relative',
                right: 655,
                bottom: 25,
            }}>My Book Collections</h1>
            {/* We pass the 'addBook' function as a prop to the 'AddBookForm' component */}
            <AddCollectionForm addCollection={addCollection}/>
            <List
                itemLayout="horizontal"
                dataSource={collections}
                size="small"
                layout="vertical"
                renderItem={item => (
                    <List.Item>
                        <List.Item.Meta
                            avatar={<Avatar src={CollectionListBookCover} />}
                            title={<Link to="/books">{item.title}</Link>}
                            description={item.description}
                        />
                    </List.Item>
                )}
            />
        </div>
    )

}