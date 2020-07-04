import React from 'react';
import { Route } from 'react-router-dom';
import Home from './containers/Home';
import Books from './containers/Books';
import CollectionList from './containers/CollectionList';
import Login from './containers/Login';
import Register from './containers/Register';
import EmailConfirm from './containers/EmailConfirm';
import Account from './containers/Account';

const BaseRouter = () => (
  <div>
    <Route exact path='/' component={Login}/>
    <Route exact path='/register' component={Register}/>
    <Route exact path='/emailconfirm' component={EmailConfirm}/>
    <Route exact path='/books' component={Books}/>
    <Route exact path='/col_list' component={CollectionList}/>
    <Route exact path='/account' component={Account}/>
  </div>
);

export default BaseRouter;
