import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/App.js';

$(function() {
  ReactDOM.render(
    <Dish data = { data } />,
    document.getElementById('dish')
  );
});
