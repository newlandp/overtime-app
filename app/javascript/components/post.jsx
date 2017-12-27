import React from 'react';
import ReactDOM from 'react-dom';
import { applyMiddleware, createStore } from 'redux';
import ReduxPromise from 'redux-promise';
import Provider from 'react-redux';

import PostsIndex from './posts_index';
import reducers from '../reducers/index';

