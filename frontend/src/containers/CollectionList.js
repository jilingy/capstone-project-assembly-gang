import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useForm, Controller } from 'react-hook-form';
import { Form, Input, Button, Popover, Table } from 'antd';
import { connect } from 'react-redux';
import axios from 'axios';
import moment from 'moment';

import {
    EditOutlined,
} from '@ant-design/icons';

// Destructuring props...
function AddCollectionForm({ props: Props, setLen: setLength, len: Length }) {

    const [visible, hideForm] = useState(false);

    const { handleSubmit, errors, reset, control, defaultValues } = useForm({
        defaultValues: {
            "collectionTitle": '',
            "collectionDesc": '',
        },
    });

    const handleVisibleChange = visible => {
        hideForm(visible)
    }

    const onSubmit = (data) => {
        // UPDATE: Add new collection for user by sending POST request to 
        // relevant API endpoint (making use of user_id from redux store)
        axios.post('http://127.0.0.1:8000/api/collections/', {
            collection_type: "Named",
            is_private: false,
            description: data.collectionDesc,
            collection_name: data.collectionTitle,
            owner: Props.user_id,
        })
            .then(() => {
                // Triggers useEffect() to re-render component,
                // fetching new colletions
                setLength(Length + 1);
            })
            .catch(err => {
                console.log(err);
            })
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
                                paddingLeft: 20,
                                paddingRight: 20
                            }}
                        />

                        <Controller
                            name="collectionDesc"
                            control={control}
                            rules={{ required: "Please enter a description for the collection" }}
                            as={
                                <Form.Item
                                    label="Collection Description"
                                    validateStatus={errors.collectionDesc && "error"}
                                    help={errors.collectionDesc && errors.collectionDesc.message}
                                >
                                    <Input />
                                </Form.Item>
                            }
                            style={{
                                paddingLeft: 20,
                                paddingRight: 20
                            }}
                        />
                        <Button type="primary" htmlType="submit">Submit</Button>
                        <Button type="danger" onClick={() => hideForm(false)} style={{ left: 4 }}>Cancel</Button>
                    </form>
                }
                title="Create New Collection"
                trigger="click"
                arrowPointAtCenter={true}
                visible={visible}
                onVisibleChange={handleVisibleChange}
            >
                <Button type="primary" style={{ left: 740, bottom: 70, position: 'relative' }}>+ Add Collection</Button>
            </Popover>
        </div>
    )
}

function CollectionList(props) {

    const [collectionToUpdate, setCollectionToUpdate] = useState();
    const [collections, updateCollections] = useState([]);
    const [len, setLen] = useState(collections.length);

    const { handleSubmit, errors, control } = useForm({
        defaultValues: {
            collectionTitle: 'Wow',
            collectionDesc: 'How',
        }
    });

    useEffect(() => {
        axios.get('http://127.0.0.1:8000/api/collections/')
            .then(res => {
                var filtered = res.data.filter(collection => {
                    if (18 === collection.owner) {
                        return collection;
                    } else {
                        return null;
                    }
                })
                updateCollections(filtered);
            })
    }, [len, collectionToUpdate])

    // Collection Delete
    const handleDelete = (collection_id) => {
        // UPDATE: Delete collection matching given ID by sending axios DELETE request 
        // to relevant API endpoint 
        axios.delete(`http://127.0.0.1:8000/api/collections/${collection_id}`)
            .then(res => {
                // Triggers useEffect() to re-render component,
                // fetching new colletions
                setLen(len - 1);
            }).catch(err => {
                console.log(err);
            })
    }

    const onSubmit = (data) => {
        axios.put(`http://127.0.0.1:8000/api/collections/${collectionToUpdate[0].id}/`, {
            collection_name: data.collectionTitle,
            description: data.collectionDesc
        }).then(res => {
            setLen(len + 1);
        }).catch(err => {
            console.log(err);
        })
    }

    const getCollectionData = (collection_id) => {
        var obj = collections.filter(collection => {
            if (collection.id == collection_id) {
                return collection;
            }
        })
        setCollectionToUpdate(obj);
    }

    const columns = [
        {
            title: 'Collection Name',
            dataIndex: 'collection_name',
            key: 'collection_name',
            align: "center",
            sorter: (a, b) => { return a.collection_name.localeCompare(b.collection_name)},
            render: collection_name => <p><b>{collection_name}</b></p>
        },
        {
            title: 'Collection Description',
            dataIndex: 'description',
            key: 'description',
            render: description => <p>{description}</p>
        },
        {
            title: 'Number Of Books',
            dataIndex: 'count',
            key: 'count',
            sorter: (a, b) => a.count - b.count,
            render: count => <p>{count}</p>
        },
        {
            title: 'Date Created',
            dataIndex: 'date_created',
            key: 'date_created',
            sorter: (a, b) => { return moment(a.date_created || 0).unix() - moment(b.date_created || 0).unix() },
            sortDirections: ['descend'],
            render: date_created => <p>{date_created}</p>
        },
        {
            title: 'Actions',
            key: 'id',
            dataIndex: 'id',
            render: (id, record) =>
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
                                            <Input defaultValue={collectionToUpdate ? collectionToUpdate[0].collection_name : ''} />
                                        </Form.Item>
                                    }
                                    style={{
                                        paddingLeft: 20,
                                        paddingRight: 20
                                    }}
                                />

                                <Controller
                                    name="collectionDesc"
                                    control={control}
                                    rules={{ required: "Please enter a description for the collection" }}
                                    as={
                                        <Form.Item
                                            label="Collection Description"
                                            validateStatus={errors.collectionDesc && "error"}
                                            help={errors.collectionDesc && errors.collectionDesc.message}
                                        >
                                            <Input defaultValue={collectionToUpdate ? collectionToUpdate[0].description : ''} />
                                        </Form.Item>
                                    }
                                    style={{
                                        paddingLeft: 20,
                                        paddingRight: 20
                                    }}
                                />
                                <Button type="primary" htmlType="submit">Submit</Button>
                                <Button type="danger" style={{ left: 4 }}>Cancel</Button>
                            </form>
                        }
                        title="Edit Collection"
                        trigger="click"
                        arrowPointAtCenter={true}
                    >
                        {(record.collection_type === 'Named') ? <Button onClick={() => getCollectionData(id)} type="primary" icon={<EditOutlined theme="outlined" style={{ position: 'relative', bottom: 3 }} />}>Edit</Button> : null}
                    </Popover>
                    <Button type="primary" style={{ left: 5 }}><Link to="/books">View Collection</Link></Button>
                    <Popover
                        placement="topLeft"
                        content={
                            <div style={{ width: 250 }} >
                                <p><b>Are you sure you want to delete this collection?</b></p>
                                <Button type="danger" onClick={() => handleDelete(id)}>Delete</Button>
                            </div>
                        }
                        title="Delete Collection"
                        trigger="click"
                        arrowPointAtCenter={true}
                    >
                        {(record.collection_type === 'Named') ? <Button type="danger" style={{ left: 10 }}>Delete Collection</Button> : null}
                    </Popover>
                </div>
        }
    ]

    return (
        <div>
            <h1 style={{
                position: 'relative',
                right: 590,
                bottom: 30,
            }}>My Book Collections</h1>
            <AddCollectionForm props={props} setLen={setLen} len={len} />
            {collections ? <Table
                style={{
                    position: 'relative',
                    border: '2px solid black',
                    bottom: 55,
                    width: 1650,
                    left: 130,
                }}
                dataSource={collections}
                columns={columns}
            /> : null}
        </div>
    )
}

const mapStateToProps = state => {
    return {
        user_id: state.user_id,
    }
}

export default connect(mapStateToProps)(CollectionList);
