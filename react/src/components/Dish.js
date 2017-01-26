// ESlint esversion: 6

import React from 'react';

 const Dish = props => {
   let url = `/dishes/${props.id}`;

   return(
     <div>
     <a href={url}>{props.name}</a>
     </div>
   );
 };

export default Dish;
