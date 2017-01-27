
// ESLint esversion: 6
import React from 'react';
import { Callout } from 'react-foundation';

 const Dish = props => {
  let url = `/dishes/${props.id}`;
  let onClick = () => {
    props.onClick(props.id);
  };

  let showDetails;
  if(props.clickedState === props.id) {
    showDetails = <div>
      <p>{props.description}</p>
      <button className="hollow button">
        <a href={url}>Details</a>
      </button>
      <br/>
      <br/>
    </div>;
  }

  return(
    <div>
      <Callout className="callout">
        <div className="small-6 columns">
          <img src={props.image} alt="dish photo" className="dish-img"/>
          <a href={url} className="dish-name">{props.name}</a>
        </div>
        <div className="small-6 columns">
          <p onClick = {onClick}>Show More</p>
            {showDetails}
        </div>
      </Callout><br/>
    </div>
  );
};

export default Dish;
