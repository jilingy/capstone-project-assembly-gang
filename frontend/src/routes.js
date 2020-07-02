import React from 'react';
import { Route } from 'react-router-dom';
import Home from './containers/Home';
import Books from './containers/Books';
import CollectionList from './containers/CollectionList';
import Account from './containers/Account';

const BaseRouter = () => (
  <div>
    <Route exact path='/' component={Home}/>
    <Route exact path='/books' component={Books}/>
    <Route exact path='/col_list' component={CollectionList}/>
    <Route exact path='/account' component={Account}/>
  </div>
);

export default BaseRouter;
