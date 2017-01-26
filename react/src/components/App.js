// ESLint esversion: 6

import React, { Component } from 'react';
import Dish from './Dish';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      dishes: []
    };
    this.fetchData = this.fetchData.bind(this);
  }

  componentDidMount(){
    this.fetchData();
    setInterval(this.fetchData, 3000);
  }

  fetchData(){
    fetch('/api/v1/dishes')
    .then(response => {
      if(response.ok) {
        return response.json();
      } else {
        let errorMessage = `${response.status} (${response.statusText})`,
        error = new Error(errorMessage);
        throw(error);
      }
    })
    .then(data => {
      this.setState({ dishes: data });
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    let dishes = this.state.dishes.map(dish => {
      return(
        <Dish
        key = {dish.id}
        id = {dish.id}
        creator = {dish.creator}
        name = {dish.name}
        description = {dish.description}
        reviews = {dish.reviews}
        />
      );
    });

    return(
      <div>
        {dishes}
      </div>
    );
  }
}

export default App;
