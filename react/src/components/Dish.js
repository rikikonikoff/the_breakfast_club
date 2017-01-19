import React from 'react';
import Review from './Review';

const Dish = props => {
  let reviews = this.props.data.map(review => {
    return(
      <Review
      key = {review.id}
      user = {review.user}
      rating = {review.rating}
      body = {review.body}
      />
    );
  });
  return(
    <h1>hi just making sure i work</h1>
  );
};

export default Dish;
