import React, { useState, useEffect } from 'react';
import { apiAccount } from '../services/utilities/API';
import { useForm, Controller } from 'react-hook-form';
import { Input, Button, Form, Popover } from 'antd';
import { connect } from 'react-redux';

function Account(props) {
    const userId = parseInt(props.user_id);
    console.log(userId);
    const [visible, hideForm] = useState(false);
    const { handleSubmit, errors, reset, control, defaultValues } = useForm({});
    const [account, setAccount] = useState({});

    useEffect(() => {
        getUserAccount();
    }, []);

    const getUserAccount = () => {
        apiAccount.getSingle(userId).then(res => {
            setAccount(res.data);
        })
    };

    const handleVisibleChange = visible => {
        hideForm(visible)
    };

    const onSubmit = (data) => {
        if(!data || data.newName === "") return;

        apiAccount.patch(userId, {
            first_name: data.firstName,
        }).then(
            setAccount(data.firstName)
        )

    };

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
                    <strong>First Name: </strong>
                    {account.first_name}

                    <Popover
                        content={
                            <form
                                style = {{ width: 500}}
                                onSubmit={handleSubmit(onSubmit)}
                            >
                                <Controller
                                    name="firstName"
                                    control={control}
                                    as={
                                        <Form.Item
                                            label="First Name"
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
    );
};

const mapStateToProps = state => {
    return {
        user_id: state.user_id,
    }
};

export default connect(mapStateToProps)(Account);