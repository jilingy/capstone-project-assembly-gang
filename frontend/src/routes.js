import React from 'react';
import { Route, Switch } from 'react-router-dom';
import Books from './containers/Books';
import CollectionList from './containers/CollectionList';
import Login from './containers/Login';
import Register from './containers/Register';
import EmailConfirm from './containers/EmailConfirm';
import Account from './containers/Account';
import PrivateRoute from './common/PrivateRoute';

const BaseRouter = () => (
  <div>
    <Switch>
      <Route exact path='/' component={Login}/>
      <Route exact path='/register' component={Register}/>
      <Route exact path='/emailconfirm' component={EmailConfirm}/>
      <PrivateRoute path='/books' component={Books}/>
      <PrivateRoute path='/col_list' component={CollectionList}/>
      <PrivateRoute exact path='/account' component={Account}/>
    </Switch>
  </div>
);

export default BaseRouter;
