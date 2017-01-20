import React, { Component } from 'react';
import Dish from "./Dish";

class App extends Component {
  constructor(props){
    super(props);
    this.state = {
      dishes: [],
      selectedDishId: null,
    };
    this.handleClick = this.handleClick.bind(this);
  }

  componentDidMount() {
    fetch("/api/v1/dishes")
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

  handleClick(id) {
    if (id === this.state.selectedDishId) {
      this.setState({ selectedDishId: null });
    } else {
      this.setState({ selectedDishId: id });
    }
  }

  render(){
    let dishes = this.state.dishes.map(dish => {
      let onClick = () => {
        this.handleClick(dish.id);
      };
      return(
        <Dish
        key = {dish.id}
        id = {dish.id}
        creator_id = {dish.creator_id}
        name = {dish.name}
        description = {dish.description}
        handleClick = {onClick}
        clickedState = {this.state.selectedDishId}
        />
      );
    });

    // let display;
    // if(this.sate.selectedDishId === null) {
    //   display = dishes;
    // } else {
    //   display = dishes.find(dish.id = this.state.selectedDishId);
    // }

    return(
      <div>
        {dishes}
      </div>
    );
  }
}

export default App;
