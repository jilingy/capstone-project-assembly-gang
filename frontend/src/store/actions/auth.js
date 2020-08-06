import * as actionTypes from './actionTypes';
import { alertTypes } from './alertTypes';
import axios from 'axios';
import { apiCollections } from "../../services/utilities/API";

export const alert_success = (message) => {
    return {
        type: alertTypes.SUCCESS, message
    }
}

export const alert_error = (message) => {
    return {
        type: alertTypes.ERROR, message
    }
}

export const alert_clear = (message) => {
    return {
        type: alertTypes.CLEAR
    }
}

export const authStart = () => {
    return {
        type: actionTypes.AUTH_START
    }
}

export const authSuccess = (token, user_id, fname, lname, uname, email) => {
    return {
        type: actionTypes.AUTH_SUCCESS,
        token: token,
        user_id: user_id,
        fname: fname,
        lname: lname,
        uname: uname,
        email: email,
    }
}

export const authFail = (error) => {
    return {
        type: actionTypes.AUTH_FAIL,
        error: error
    }
}

export const logout = () => {
    
    localStorage.removeItem('token');
    localStorage.removeItem('expirationDate');
    localStorage.removeItem('user_id');
    localStorage.removeItem('fname');
    localStorage.removeItem('lname');
    localStorage.removeItem('uname');
    localStorage.removeItem('email');
    localStorage.removeItem('user');

    return {
        type: actionTypes.AUTH_LOGOUT
    }
}

export const checkAuthTimeout = (expirationTime) => {
    return dispatch => {
        setTimeout(() => {
            dispatch(logout())
        }, expirationTime * 1000)
    }
}

export const authGoogleSignAndLogin = (access_token, id_token) => {
    return dispatch => {
        dispatch(authStart());
        axios.post("https://localhost:8000/rest-auth/google/", {
            access_token: id_token,
        }).then(res => {

            // Only If user account does not exist, create default collections for user
            if(res.data.exists === false)
                if(res.data.user.id !== null) {
                    apiCollections.post({
                        collection_type : "Main",
                        is_private      : false,
                        description     : 'This is your Main Collection',
                        collection_name : 'Main Collection',
                        owner           : res.data.user.id,
                    }).catch(err => {
                        console.log(err);
                    });
                    apiCollections.post({
                        collection_type : "Finished",
                        is_private      : false,
                        description     : 'This is your Finished Collection',
                        collection_name : 'Finished Collection',
                        owner           : res.data.user.id,
                    }).catch(err => {
                        console.log(err);
                    });
                }
        
            const user_id = res.data.user.id;
            const fname = res.data.user.first_name;
            const lname = res.data.user.last_name;
            const uname = res.data.user.username;
            const email = res.data.user.email;
            
            const token = res.data.token;
            const expirationDate = new Date(new Date().getTime() + 3600 * 1000);
            
            localStorage.setItem('token', token);
            localStorage.setItem('expirationDate', expirationDate);
            localStorage.setItem('user_id', user_id);
            localStorage.setItem('fname', fname);
            localStorage.setItem('lname', lname);
            localStorage.setItem('uname', uname);
            localStorage.setItem('email', email);
            
            dispatch(authSuccess(token, user_id, fname, lname, uname, email));
            dispatch(checkAuthTimeout(3600));
        }).catch(err => {
            dispatch(authFail('Invalid Login Credentials!'));
            console.log(err);
        });
    }
}

export const authLogin = (username, password) => {
    return dispatch => {
        dispatch(authStart());
        axios.post('https://localhost:8000/api/auth/login' , {
            username: username,
            password: password
        })
        .then(res => {
            
            const user_id = res.data.user.id;
            const fname = res.data.user.first_name;
            const lname = res.data.user.last_name;
            const uname = res.data.user.username;
            const email = res.data.user.email;
            
            const token = res.data.token;
            const expirationDate = new Date(new Date().getTime() + 3600 * 1000);
            
            localStorage.setItem('token', token);
            localStorage.setItem('expirationDate', expirationDate);
            localStorage.setItem('user_id', user_id);
            localStorage.setItem('fname', fname);
            localStorage.setItem('lname', lname);
            localStorage.setItem('uname', uname);
            localStorage.setItem('email', email);
            
            dispatch(authSuccess(token, user_id, fname, lname, uname, email));
            dispatch(checkAuthTimeout(3600));
        })
        .catch(err => {
            dispatch(authFail('Invalid Login Credentials!'));
        })
    }
}

export const authSignup = (username, email, first_name, last_name, password) => {
    return dispatch => {
        dispatch(authStart());
        axios.post('https://localhost:8000/api/auth/register' , {
            username: username,
            email: email,
            password: password,
            first_name: first_name,
            last_name: last_name
        })
        .then(res => {
            
            const user_id = res.data.user.id;
            const fname = res.data.user.first_name;
            const lname = res.data.user.last_name;
            const uname = res.data.user.username;
            const email = res.data.user.email;
            
            const token = res.data.key;
            const expirationDate = new Date(new Date().getTime() + 3600 * 1000);
            
            localStorage.setItem('token', token);
            localStorage.setItem('expirationDate', expirationDate);
            localStorage.setItem('user_id', user_id);
            localStorage.setItem('fname', fname);
            localStorage.setItem('lname', lname);
            localStorage.setItem('uname', uname);
            localStorage.setItem('email', email);
            
            dispatch(authSuccess(token, user_id, fname, lname, uname, email));
            dispatch(checkAuthTimeout(3600));
        })
        .catch(err => {
            dispatch(authFail('Sign up failed!'))
        })
    }
}

export const authCheckState = () => {
    return dispatch => {
        
        const token = localStorage.getItem('token');
        const user_id = localStorage.getItem('user_id');
        const fname = localStorage.getItem('fname');
        const lname = localStorage.getItem('lname');
        const uname = localStorage.getItem('uname');
        const email = localStorage.getItem('email');
        
        if(token === undefined) {
            dispatch(logout())
        } else {
            const expirationDate = new Date(localStorage.getItem('expirationDate'))
            if (expirationDate <= new Date()) {
                dispatch(logout()); 
            } else {
                dispatch(authSuccess(token, user_id, fname, lname, uname, email));
                dispatch(checkAuthTimeout((expirationDate.getTime() - new Date().getTime()) / 1000));
            }
        }
    }
}