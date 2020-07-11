import * as actionTypes from './actionTypes';
import { alertTypes } from './alertTypes';
import axios from 'axios';

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

export const authSuccess = (token, user_id) => {
    return {
        type: actionTypes.AUTH_SUCCESS,
        token: token,
        user_id: user_id
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

export const authLogin = (username, password) => {
    return dispatch => {
        dispatch(authStart());
        axios.post('http://localhost:8000/api/auth/login' , {
            username: username,
            password: password
        })
        .then(res => {
            const user_id = res.data.user.id;
            const token = res.data.token;
            const expirationDate = new Date(new Date().getTime() + 900 * 1000);
            localStorage.setItem('token', token);
            localStorage.setItem('expirationDate', expirationDate);
            localStorage.setItem('user_id', user_id);
            dispatch(authSuccess(token, user_id));
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
        axios.post('http://localhost:8000/api/auth/register' , {
            username: username,
            email: email,
            password: password,
            first_name: first_name,
            last_name: last_name
        })
        .then(res => {
            const user_id = res.data.user.id;
            const token = res.data.key;
            const expirationDate = new Date(new Date().getTime() + 900 * 1000);
            localStorage.setItem('token', token);
            localStorage.setItem('expirationDate', expirationDate);
            localStorage.setItem('user_id', user_id);
            dispatch(authSuccess(token, user_id));
            dispatch(checkAuthTimeout(900));
        })
        .catch(err => {
            dispatch(authFail('Invalid login credentials!'))
        })
    }
}

export const authCheckState = () => {
    return dispatch => {
        const token = localStorage.getItem('token');
        const user_id = localStorage.getItem('user_id');
        if(token === undefined) {
            dispatch(logout())
        } else {
            const expirationDate = new Date(localStorage.getItem('expirationDate'))
            if (expirationDate <= new Date()) {
                dispatch(logout()); 
            } else {
                dispatch(authSuccess(token, user_id));
                dispatch(checkAuthTimeout(expirationDate.getTime() - ((new Date()).getTime()) / 1000));
            }
        }
    }
}