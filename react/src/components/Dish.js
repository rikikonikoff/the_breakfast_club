import React, { Component } from 'react';
import Review from './Review';

 class Dish extends Component {
  constructor(props) {
    super(props);
    this.state = {
      reviews: [],
      users: []
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

//     fetch("/api/v1/users")
//       .then(response => {
//         if(response.ok) {
//           return response.json();
//         } else {
//           let errorMessage = `${response.status} (${response.statusText})`,
//               error = new Error(errorMessage);
//           throw(error);
//         }
//       })
//       .then(data => {
//         this.setState({ users: data });
//       })
//       .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

render() {
  let reviews = this.state.reviews.map(review => {
    return(
      <Review
      key = {review.id}
      id = {review.id}
      dish_id = {review.dish_id}
      dish_name = {this.props.name}
      dish_description = {this.props.description}
      dish_creator_id = {this.props.creator_id}
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

  // let users = this.state.users.map(user => {
  //   return(
  //     <User
  //     key = {user.id}
  //     id = {user.id}
  //     username = {user.username}
  //     avatar_url = {user.avatar.url}
  //     />
  //   );
  // });

  let url = `/dishes/${this.props.id}/reviews/new`;

  let showDetails;
  if (this.props.clickedState === this.props.id) {
    showDetails =
                  <div>
                    <p>Description: {this.props.description}</p>
                    {reviews}
                    <p>
                      <a href={url}>Review This Dish</a>
                    </p>
                  </div>;
  }

  return(
      <div>
        <p id={this.props.id} onClick={this.props.handleClick}>{this.props.name}</p>
        {showDetails}
      </div>
    );
  }
}

export default Dish;
