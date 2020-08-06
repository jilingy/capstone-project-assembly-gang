import React, { useState, useEffect } from 'react';
import { apiAccount } from '../services/utilities/API';
import { useForm, Controller } from 'react-hook-form';
import { Input, Button, Form, Popover, Typography } from 'antd';
import { connect } from 'react-redux';
import axios from 'axios';
import Fade from 'react-reveal/Fade';
import Table from '@material-ui/core/Table';
import TableBody from '@material-ui/core/TableBody';
import TableCell from '@material-ui/core/TableCell';
import TableContainer from '@material-ui/core/TableContainer';
import TableHead from '@material-ui/core/TableHead';
import TableRow from '@material-ui/core/TableRow';
import { makeStyles } from '@material-ui/core/styles';
import Paper from '@material-ui/core/Paper';


function Account(props) {
    const userId = parseInt(props.user_id);
    const [visibleFirst, hideFirstForm] = useState(false);
    const [visibleLast, hideLastForm] = useState(false);
    const [visibleEmail, hideEmailForm] = useState(false);
    const [visibleUsername, hideUsernameForm] = useState(false);
    const [visiblePassword, hidePasswordForm] = useState(false);
    const { handleSubmit, control } = useForm({});
    const [account, setAccount] = useState({});
    const [firstName, setFirstName] = useState();
    const [lastName, setLastName] = useState();
    const [email, setEmail] = useState();
    const [username, setUsername] = useState();
    const [password, setPassword] = useState();
    const { Title } = Typography



    useEffect(() => {
        getUserAccount();
    }, []);

    useEffect(() => {
        getUserAccount();
    }, [firstName, lastName, email, username, password]);

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

    const handlePasswordVisibleChange = visiblePassword => {
        hidePasswordForm(visiblePassword)
    };

    const onSubmitFirst = (data) => {
        if(!data) return;

        if (data.firstName && data.firstName !== "") {
            apiAccount.patch(userId, {
                first_name: data.firstName,
            }).then(
                setFirstName(data.firstName)
            )
        }
    };

    const onSubmitLast = (data) => {
        if(!data) return;

        if (data.lastName && data.lastName !== "") {
            apiAccount.patch(userId, {
                last_name: data.lastName,
            }).then(
                setLastName(data.lastName)
            )
        }
    };

    const onSubmitEmail = (data) => {
        if(!data) return;

        if (data.email && data.email !== "") {
            apiAccount.patch(userId, {
                email: data.email,
            }).then(
                setEmail(data.email)
            )
        }
    };

    const onSubmitUsername = (data) => {
        if(!data) return;

        if (data.username && data.username !== "") {
            apiAccount.patch(userId, {
                username: data.username,
            }).then(
                setUsername(data.username)
            )
        }
    };

    const onSubmitPassword = (data) => {
        if(!data) return;

        if (data.password && data.password !== "") {
            axios.patch('http://localhost:8000/api/auth/register', {
                password: data.password,
            });
            // apiAccount.patch(userId, {
            //     password: data.password,
            // }).then(
            //     setPassword(data.password)
            // )
        }
    };

    function createData(heading, info, button) {
        return { heading, info, button}
    }

    const useStyles = makeStyles({
        table: {
          minWidth: 650,
        },
      });

    const classes = useStyles();

    const firstNameButton =
    <Popover
        content={
            <form
                style = {{ width: 500}}
                onSubmit={handleSubmit(onSubmitFirst)}
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
                <Button type="primary" onClick={() => hideFirstForm(false)} htmlType="submit">Submit</Button>
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

    const lastNameButton =
    <Popover
        content={
            <form
                style = {{ width: 500}}
                onSubmit={handleSubmit(onSubmitLast)}
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
                <Button type="primary" onClick={() => hideLastForm(false)} htmlType="submit">Submit</Button>
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

    const emailButton =
    <Popover
        content={
            <form
                style = {{ width: 500}}
                onSubmit={handleSubmit(onSubmitEmail)}
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
                <Button type="primary" onClick={() => hideEmailForm(false)} htmlType="submit">Submit</Button>
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

    const usernameButton =
    <Popover
        content={
            <form
                style = {{ width: 500}}
                onSubmit={handleSubmit(onSubmitUsername)}
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
                <Button type="primary" onClick={() => hideUsernameForm(false)} htmlType="submit">Submit</Button>
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

    const passwordButton =
    <Popover
        content={
            <form
                style = {{ width: 500}}
                onSubmit={handleSubmit(onSubmitPassword)}
            >
                <Controller
                    name="password"
                    control={control}
                    as={
                        <Form.Item
                            label="Password"
                        >
                            <Input />
                        </Form.Item>
                    }
                />
                <Button type="primary" onClick={() => hidePasswordForm(false)} htmlType="submit">Submit</Button>
                <Button type="danger" onClick={() => hidePasswordForm(false)} style={{ left: 4 }}>Cancel</Button>
            </form>
        }
        trigger='click'
        visible={visiblePassword}
        onVisibleChange={handlePasswordVisibleChange}
        title="Update Password"
    >
        <Button type="primary" style={{marginLeft:'25px'}}>Edit</Button>
    </Popover>

    const rows = [
        createData('First Name', account.first_name, firstNameButton),
        createData('Last Name', account.last_name, lastNameButton),
        createData('Email', account.email, emailButton),
        createData('Username', account.username, usernameButton),
        createData('Password', '********', passwordButton)
    ];

    return (
        <div>
            <div style={{ height: 100, border: '2px solid black', background: `linear-gradient(#283048 , #859398)` }}>
                <Fade cascade>
                    <Title
                        level={3}
                        style={{
                            color: 'white',
                            fontSize: 50,
                            position: 'relative',
                            right: 515,
                            textAlign: "center",
                            fontFamily: "Book Antiqua,Georgia,Times New Roman,serif"
                        }}>My Account
                    </Title>
                </Fade>
            </div>

            <div>
                <TableContainer component={Paper}>
                    <Table className={classes.table} aria-label="simple table">
                    <TableBody>
                        {rows.map((row) => (
                            <TableRow key={row.name}>
                                <TableCell component="th" scope="row">
                                    {row.name}
                                </TableCell>
                                <TableCell align="center" style={{fontWeight:'bold'}}>{row.heading}</TableCell>
                                <TableCell align="center">{row.info}</TableCell>
                                <TableCell align="center">{row.button}</TableCell>
                                </TableRow>
                            ))}
                        </TableBody>
                    </Table>
                </TableContainer>
            </div>
        </div>
    );
};

const mapStateToProps = state => {
    return {
        user_id: state.user_id,
    }
};

export default connect(mapStateToProps)(Account);