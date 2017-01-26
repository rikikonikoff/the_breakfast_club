
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
        <img src={props.image} alt="dish photo" className="img-responsive"/>
          <p onClick = {onClick}>{props.name}</p>
            {showDetails}
      </Callout><br/>
    </div>
  );
};

export default Dish;
