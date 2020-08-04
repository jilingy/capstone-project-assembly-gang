import React, { useState, useEffect } from 'react';
import { apiAccount, apiGoal, apiReads } from '../services/utilities/API';
import { useForm, Controller } from 'react-hook-form';
import { connect } from 'react-redux';
import { Typography as AntType, Popover, Form, Input, Button } from 'antd';
import Fade from 'react-reveal/Fade';
import Table from '@material-ui/core/Table';
import TableBody from '@material-ui/core/TableBody';
import TableContainer from '@material-ui/core/TableContainer';
import TableRow from '@material-ui/core/TableRow';
import { makeStyles, withStyles } from '@material-ui/core/styles';
import Paper from '@material-ui/core/Paper';
import PropTypes from 'prop-types';
import CircularProgress from '@material-ui/core/CircularProgress';
import Typography from '@material-ui/core/Typography';
import Box from '@material-ui/core/Box';
import MuiTableCell from "@material-ui/core/TableCell";

const TableCell = withStyles({
  root: {
    borderBottom: "none"
  }
})(MuiTableCell);

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
        <Typography variant="caption" component="div" color="textSecondary" style={{fontSize: 20}}>{`${Math.round(
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


function OtherProfile(props) {
    const other = props.location.state.profile
    const userId = parseInt(other.id);
    const monthNumber = (new Date().getMonth());
    const monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
    const monthName = monthNames[monthNumber];
    const newGoal = { user: userId, current_month: monthNumber, reading_goal: 0 };


    const [goal, setGoal] = useState({});
    const { Title } = AntType;
    const [reads, setReads] = useState(0);
    const [goalVal, setGoalVal] = useState();


    useEffect(() => {
        getGoal();
        getReads();
    }, []);

    useEffect(() => {
        getGoal();
    }, [goalVal]);


    const getGoal = () => {
        apiGoal.getSingle(userId).then(res => {
            setGoal(res.data);
            if (res.data.current_month !== monthNumber) {
                setGoal( prevGoal => ({
                    ...prevGoal,
                    current_month: monthNumber
                }))
            }
        }).catch(e => {
            setGoal(newGoal);
        })
    };

    const getReads = () => {
        apiReads.getAll()
        .then(res => {
            setReads(res.data.filter(read => {
                return read.user === userId && read.month_added === monthNumber;
            }).length);
        });
    }


    function createData(heading, info, button) {
        return { heading, info, button}
    }

    const useStyles = makeStyles({
        table: {
          minWidth: 650,
        },
      });

    const classes = useStyles();
    
    const progress = reads >= goal.reading_goal ?
    100
    :
    100*reads/goal.reading_goal;

    const progressCircle = <CircularProgressWithLabel
        color="primary"
        value={progress}
        size={70}
    />


    const headRow = [
        createData("Books Read in " + monthName, other.username + "'s Reading Goal for " + monthName, "Progress"),
    ];
    const rows = [
        createData(reads, goal.reading_goal, progressCircle),
    ];
    

    return (
        <div>
            {console.log(other)}
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
                        }}>{other.username + "'s Profile"}
                    </Title>
                </Fade>
            </div>

            <div>  
                <TableContainer component={Paper}>
                    <Table className={classes.table} aria-label="simple table">
                        <TableBody>
                            {headRow.map((row) => (
                                <TableRow key={row.name}>
                                    <TableCell component="th" scope="row">
                                        {row.name}
                                    </TableCell>
                                    <TableCell align="center" style={{fontWeight:'bold', fontSize: 20}}>{row.heading}</TableCell>
                                    <TableCell align="center" style={{fontWeight:'bold', fontSize: 20}}>{row.info}</TableCell>
                                    <TableCell align="center" style={{fontWeight:'bold', fontSize: 20}}>{row.button}</TableCell>
                                </TableRow>
                            ))}
                            {rows.map((row) => (
                                <TableRow key={row.name}>
                                    <TableCell component="th" scope="row">
                                        {row.name}
                                    </TableCell>
                                    <TableCell align="center" style={{fontSize: 20}}>{row.heading}</TableCell>
                                    <TableCell align="center" style={{fontSize: 20}}>{row.info}</TableCell>
                                    <TableCell align="center" style={{fontSize: 20}}>{row.button}</TableCell>
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

export default connect(mapStateToProps)(OtherProfile);