import React from 'react';
import { connect } from 'react-redux';
import { Route, Redirect } from 'react-router-dom';

const PrivateRoute = ({ component: Component, ...rest }) => (
    <Route 
        {...rest}
        render={props =>
            localStorage.getItem('token') ? <Component {...props} /> : <Redirect to='/'/>
        }
    />
);

export default connect()(PrivateRoute);