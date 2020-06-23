import React from 'react';
import { Route } from 'react-router-dom';
import TestContainer from './containers/TestContainer';
import HooksContainer from './containers/HooksContainer';

const BaseRouter = () => (
  <div>
    <Route exact path='/' component={HooksContainer}/>
  </div>
);

export default BaseRouter;
