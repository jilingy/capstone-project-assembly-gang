import React from 'react';
import { Route } from 'react-router-dom';
import TestContainer from './containers/TestContainer';

const BaseRouter = () => (
  <div>
    <Route exact path='/' component={TestContainer}/>
  </div>
);

export default BaseRouter;
