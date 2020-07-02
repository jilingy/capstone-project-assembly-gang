import React, { useState, useEffect } from 'react';
import CustomCard from '../components/Card';
import axios from 'axios';
import { fixControlledValue } from 'antd/lib/input/Input';
import { useForm, Controller } from 'react-hook-form';
import { Form, Input, Button, Popover, Table } from 'antd';

export default function Account() {
    const [visible, hideForm] = useState(false);
    const [account, setAccount] = useState({ id: 2, name: "testuser", email: "test@test.com", username: "testuser98"})

    const handleVisibleChange = visible => {
        hideForm(visible)
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
                            >
                                {/* <Controller


                                /> */}
                                <Button type="primary" htmlType="submit">Submit</Button>
                                <Button type="danger" onClick={() => hideForm(false)} style={{ left: 4 }}>Cancel</Button>
                            </form>
                        }

                        visible={visible}
                        onVisibleChange={handleVisibleChange}
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