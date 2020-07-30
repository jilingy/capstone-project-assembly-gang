import React, { useState, useEffect } from 'react';
import { apiAccount, apiCollections, apiContains, apiBooks, apiReviews } from '../services/utilities/API';
import { useForm, Controller } from 'react-hook-form';
import { Link } from 'react-router-dom';
import { Form, Input, Button, Popover, message, Spin, Carousel, Switch } from 'antd';
import { connect } from 'react-redux';
import { Typography as AntType } from 'antd';
import { Table as AntTable } from 'antd';
import moment from 'moment';
import Fade from 'react-reveal/Fade';
import Table from '@material-ui/core/Table';
import TableBody from '@material-ui/core/TableBody';
import TableCell from '@material-ui/core/TableCell';
import TableContainer from '@material-ui/core/TableContainer';
import TableRow from '@material-ui/core/TableRow';
import { makeStyles } from '@material-ui/core/styles';
import Paper from '@material-ui/core/Paper';
import PropTypes from 'prop-types';
import CircularProgress from '@material-ui/core/CircularProgress';
import Typography from '@material-ui/core/Typography';
import Box from '@material-ui/core/Box';
import CollectionList from './CollectionList';

import {
    EditOutlined,
} from '@ant-design/icons';

const key = 'updatable';

function CircularProgressWithLabel(props) {
  return (
    <Box position="relative" display="inline-flex">
      <CircularProgress variant="static" {...props} />
      <Box
        top={0}
        left={0}
        bottom={0}
        right={0}
        position="absolute"
        display="flex"
        alignItems="center"
        justifyContent="center"
      >
        <Typography variant="caption" component="div" color="textSecondary">{`${Math.round(
          props.value,
        )}%`}</Typography>
      </Box>
    </Box>
  );
}

CircularProgressWithLabel.propTypes = {
  /**
   * The value of the progress indicator for the determinate and static variants.
   * Value between 0 and 100.
   */
  value: PropTypes.number.isRequired,
};


function Profile(props) {
    const userId = parseInt(props.user_id);
    const { handleSubmit, control } = useForm({});
    const [account, setAccount] = useState({});
    const [firstName, setFirstName] = useState();
    const [lastName, setLastName] = useState();
    const [email, setEmail] = useState();
    const [username, setUsername] = useState();
    const [password, setPassword] = useState();
    const { Title } = AntType;
    const [progress, setProgress] = React.useState(10);

    React.useEffect(() => {
        const timer = setInterval(() => {
          setProgress((prevProgress) => (prevProgress >= 100 ? 10 : prevProgress + 10));
        }, 800);
        return () => {
          clearInterval(timer);
        };
    }, []);

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

    const getBooksRead = () => {
        apiAccount.getSingle(userId).then(res => {
            setAccount(res.data);
        })
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

    function createData(heading, info, button) {
        return { heading, info, button}
    }

    const useStyles = makeStyles({
        table: {
          minWidth: 650,
        },
      });

    const classes = useStyles();

    const progressCircle = <CircularProgressWithLabel value={progress} />

    const rows = [
        createData('My Monthly Reading Goal', progressCircle, ""),
        createData('Last Name', account.last_name, ""),

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
                        }}>My Profile
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

export default connect(mapStateToProps)(Profile);