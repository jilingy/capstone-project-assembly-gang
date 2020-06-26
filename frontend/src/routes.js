import React from 'react';
import { Route } from 'react-router-dom';
import Home from './containers/Home';
import Books from './containers/Books';

const BaseRouter = () => (
  <div>
    <Route exact path='/' component={Home}/>
    <Route exact path='/books' component={Books}/>
  </div>
);

export default BaseRouter;
