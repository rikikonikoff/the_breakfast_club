import React, { Component } from 'react';
import Dish from "./Dish";


class App extends Component {
  constructor(props){
    super(props);
    this.state = {
      dishes: []
    };
  }

  componentWillMount() {
    $.ajax({
      url: "/api/v1/dishes",
      contentType: "application/json"
    })
    .done(data => {
      this.setState({ dishes: data[0] });
    });
  }

  render(){
    let dishes = this.state.dishes.map(dish => {
      return(
        <Dish
        key = {dish.id}
        creator = {dish.creator}
        name = {dish.name}
        description = {dish.description}
        reviews = {dish.reviews}
        />
      );
    });
    return(
      <div>
        <ul style="list-style: none;">
          { dishes }
        </ul>
      </div>
    );
  }
}

export default App;
