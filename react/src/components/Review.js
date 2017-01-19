import React, { Component } from 'react';

class Review extends Component{
  constructor(props) {
    super(props);
    this.state = {
      likesCount: 0,
      dislikesCount: 0
    };
    this.handleUpVote = this.handleUpVote.bind(this);
    this.handleDownVote = this.handleDownVote.bind(this);
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
      <li>
        {this.props.reviewer}: {this.props.rating} {this.props.body}
        Created at: {this.props.created_at.strftime("%B %d %Y")}
      </li>
    );
  }
}
