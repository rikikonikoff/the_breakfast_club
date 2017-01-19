import React, { Component } from 'react';
import Review from './Review';

class Dish extends Component {
  constructor(props) {
    super(props);
    this.state = {
      data: []
    };
  }

  render(){
    let reviews = this.props.data.map(review => {
      return(
        <Review
        key = {review.id}
        reviewer = {review.reviewer}
        rating = {review.rating}
        body = {review.body}
        created_at = {review.created_at}
        />
      );
    });
    return(
      <div>
        <ul style="list-style: none;">
          { reviews }
        </ul>
      </div>
    );
  }
}

export default Dish;
