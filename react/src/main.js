import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import Dish from '../../app/assets/javascripts/components/Dish.js.jsx';

$(function() {
  ReactDOM.render(
    <Dish />,
    document.getElementById('Dish')
  );
});
