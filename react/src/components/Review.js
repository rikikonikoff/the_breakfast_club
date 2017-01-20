import React, { Component } from 'react';

class Review extends Component{
  constructor(props) {
    super(props);
    this.state = {
      reviewer: "",
      likesCount: 0,
      dislikesCount: 0
    };
    this.handleUpVote = this.handleUpVote.bind(this);
    this.handleDownVote = this.handleDownVote.bind(this);
  }

  componentDidMount() {
    fetch(`/api/v1/dishes/${this.props.dish_id}/reviews/${this.props.id}`)
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
        return data.username;
      })
      .then(username => {
        this.setState({ reviewer: username });
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  handleUpVote(event) {
    event.preventDefault();
    this.setState({  });
  }

  handleDownVote(event) {
    event.preventDefault();
    this.setState({  });
  }


  render() {


    return(
      <div>
        <p>
          Rating: {this.props.rating} ({this.state.reviewer}) {this.props.body}
        </p>
      </div>
    );
  }
}

export default Review;
