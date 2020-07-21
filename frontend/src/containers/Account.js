import React, { useState, useEffect } from 'react';
import { apiAccount } from '../services/utilities/API';
import { useForm, Controller } from 'react-hook-form';
import { Input, Button, Form, Popover } from 'antd';
import { connect } from 'react-redux';

function Account(props) {
    const userId = parseInt(props.user_id);
    const [visibleFirst, hideFirstForm] = useState(false);
    const [visibleLast, hideLastForm] = useState(false);
    const [visibleEmail, hideEmailForm] = useState(false);
    const [visibleUsername, hideUsernameForm] = useState(false);
    const { handleSubmit, control } = useForm({});
    const [account, setAccount] = useState({});

    useEffect(() => {
        getUserAccount();
    }, []);

    const getUserAccount = () => {
        apiAccount.getSingle(userId).then(res => {
            setAccount(res.data);
        })
    };

    const handleFirstVisibleChange = visibleFirst => {
        hideFirstForm(visibleFirst)
    };

    const handleLastVisibleChange = visibleLast => {
        hideLastForm(visibleLast)
    };

    const handleEmailVisibleChange = visibleEmail => {
        hideEmailForm(visibleEmail)
    };

    const handleUsernameVisibleChange = visibleUsername => {
        hideUsernameForm(visibleUsername)
    };

    const onSubmit = (data) => {
        if(!data) return;

        if (data.firstName != "") {
            apiAccount.patch(userId, {
                first_name: data.firstName,
            }).then(
                setAccount(data.firstName)
            )
        } else if (data.lastName != "") {
            apiAccount.patch(userId, {
                last_name: data.lastName,
            }).then(
                setAccount(data.lastName)
            )
        } else if (data.email != "") {
            apiAccount.patch(userId, {
                last_name: data.lastName,
            }).then(
                setAccount(data.email)
            )
        } else if (data.username != "") {
            apiAccount.patch(userId, {
                username: data.username,
            }).then(
                setAccount(data.username)
            )
        }
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
                                <Button type="danger" onClick={() => hideFirstForm(false)} style={{ left: 4 }}>Cancel</Button>
                            </form>
                        }
                        trigger='click'
                        visible={visibleFirst}
                        onVisibleChange={handleFirstVisibleChange}
                        title="Update First Name"
                    >
                        <Button type="primary" style={{marginLeft:'25px'}}>Edit</Button>
                    </Popover>
                </h5>
                
            </div>

            <div 
                style={{ 
                    position: 'relative',
                    textAlign: 'left'
                }}
            >
                <h5>
                    <strong>Last Name: </strong>
                    {account.last_name}

                    <Popover
                        content={
                            <form
                                style = {{ width: 500}}
                                onSubmit={handleSubmit(onSubmit)}
                            >
                                <Controller
                                    name="lastName"
                                    control={control}
                                    as={
                                        <Form.Item
                                            label="Last Name"
                                        >
                                            <Input />
                                        </Form.Item>
                                    }
                                />
                                <Button type="primary" htmlType="submit">Submit</Button>
                                <Button type="danger" onClick={() => hideLastForm(false)} style={{ left: 4 }}>Cancel</Button>
                            </form>
                        }
                        trigger='click'
                        visible={visibleLast}
                        onVisibleChange={handleLastVisibleChange}
                        title="Update Last Name"
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

                <Popover
                    content={
                        <form
                            style = {{ width: 500}}
                            onSubmit={handleSubmit(onSubmit)}
                        >
                            <Controller
                                name="email"
                                control={control}
                                as={
                                    <Form.Item
                                        label="Email"
                                    >
                                        <Input />
                                    </Form.Item>
                                }
                            />
                            <Button type="primary" htmlType="submit">Submit</Button>
                            <Button type="danger" onClick={() => hideEmailForm(false)} style={{ left: 4 }}>Cancel</Button>
                        </form>
                    }
                    trigger='click'
                    visible={visibleEmail}
                    onVisibleChange={handleEmailVisibleChange}
                    title="Update Email"
                >
                    <Button type="primary" style={{marginLeft:'25px'}}>Edit</Button>
                </Popover>

            </h5>

            <h5 style={{ 
                position: 'relative',
                textAlign: 'left'
            }}>
                <strong>Username: </strong>
                {account.username}

                <Popover
                    content={
                        <form
                            style = {{ width: 500}}
                            onSubmit={handleSubmit(onSubmit)}
                        >
                            <Controller
                                name="username"
                                control={control}
                                as={
                                    <Form.Item
                                        label="Username"
                                    >
                                        <Input />
                                    </Form.Item>
                                }
                            />
                            <Button type="primary" htmlType="submit">Submit</Button>
                            <Button type="danger" onClick={() => hideUsernameForm(false)} style={{ left: 4 }}>Cancel</Button>
                        </form>
                    }
                    trigger='click'
                    visible={visibleUsername}
                    onVisibleChange={handleUsernameVisibleChange}
                    title="Update Username"
                >
                    <Button type="primary" style={{marginLeft:'25px'}}>Edit</Button>
                </Popover>

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