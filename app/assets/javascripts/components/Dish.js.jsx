import React from 'react';
import Review from './Review';

const Dish = props => {
  let reviews = props.data.map(review => {
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

export default Dish;
