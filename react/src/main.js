import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/App';
// import Dish from '../../app/assets/javascripts/components/Dish.js.jsx';
// import data from '../../app/views/dishes/show.html.erb';

$(function() {
  ReactDOM.render(
    <App />,
    document.getElementById('dishes')
  );
});
