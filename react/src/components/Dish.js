import React, { Component } from 'react';
import Review from './Review';

 class Dish extends Component {
  constructor(props) {
    super(props);
    this.state = {
      reviews: []
    };
  }

componentDidMount() {
  fetch(`/api/v1/dishes/${this.props.id}`)
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
      this.setState({ reviews: data });
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
}

render() {
  let reviews = this.state.reviews.map(review => {
    return(
      <Review
      key = {review.id}
      id = {review.id}
      reviewer_id = {review.reviewer_id}
      rating = {review.rating}
      body = {review.body}
      created_at = {review.created_at}
      upvote_count = {review.upvote_count}
      downvote_count = {review.downvote_count}
      net_votes = {review.net_votes}
      />
    );
  });

  return(
      <div>
        <p id={this.props.id} onClick={this.props.handleClick}>{this.props.name}</p>
        <div>
          {reviews}
        </div>
      </div>
    );
  }
}

export default Dish;
