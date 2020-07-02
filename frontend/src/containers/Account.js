import React, { useState, useEffect } from 'react';
import CustomCard from '../components/Card';
import axios from 'axios';
import { fixControlledValue } from 'antd/lib/input/Input';
import { useForm, Controller } from 'react-hook-form';
import { Form, Input, Button, Popover, Table } from 'antd';

export default function Account() {
    const [visible, hideForm] = useState(false);
    const { handleSubmit, errors, reset, control, defaultValues } = useForm({});
    const [account, setAccount] = useState({ id: 2, name: "Farhan Ghazi", email: "farhansghazi@outlook.com", username: "farhanghazi"})

    const handleVisibleChange = visible => {
        hideForm(visible)
    }

    const onSubmit = (data) => {
        // After a form submit, we usually make an axios POST request to update
        // the backend. For the sake of simplicity, we only update our frontend.
        console.log(data);
        if(!data) return;
        if(data.newName === "") return;
        setAccount(
            {
                ...account,
                name: data.newName
            }
        )
    }

    return (
        <div>
            <h1 style={{
                position: 'relative',
                textAlign: 'left',
                paddingBottom: "25px"
            }}>My Account</h1>

            <div 
                style={{ 
                    position: 'relative',
                    textAlign: 'left'
                }}
            >
                <h5>
                    <strong>Name: </strong>
                    {account.name}

                    <Popover
                        content={
                            <form
                                style = {{ width: 500}}
                                onSubmit={handleSubmit(onSubmit)}
                            >
                                <Controller
                                    name="newName"
                                    control={control}
                                    as={
                                        <Form.Item
                                            label="Name"
                                        >
                                            <Input />
                                        </Form.Item>
                                    }
                                />
                                <Button type="primary" htmlType="submit">Submit</Button>
                                <Button type="danger" onClick={() => hideForm(false)} style={{ left: 4 }}>Cancel</Button>
                            </form>
                        }
                        trigger='click'
                        visible={visible}
                        onVisibleChange={handleVisibleChange}
                        title="Update name"
                    >
                        <Button type="primary" style={{marginLeft:'25px'}}>Edit</Button>
                    </Popover>
                </h5>
                
            </div>

            <h5 style={{ 
                position: 'relative',
                textAlign: 'left'
            }}>
                <strong>Email: </strong>
                {account.email}
            </h5>

            <h5 style={{ 
                position: 'relative',
                textAlign: 'left'
            }}>
                <strong>Username: </strong>
                {account.username}
            </h5>


        </div>
    )
}