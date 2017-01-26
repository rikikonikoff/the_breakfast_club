import React from 'react';
import { Callout } from 'react-foundation';

 const Dish = props => {
   let url = `/dishes/${props.id}`;
  return(
    <div>
      <Callout className="callout">
        <a href={url}>{props.name}</a>
        <div>
          <img src={props.image} alt="dish photo" className="img-responsive"/>
        </div>
      </Callout><br/>
    </div>
   );
 };

export default Dish;
