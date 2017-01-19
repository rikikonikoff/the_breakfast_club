import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import Dish from '../../app/assets/javascripts/components/Dish.js';

$(function() {
  ReactDOM.render(
    <Dish data = { data } />,
    document.getElementById('dish')
  );
});
