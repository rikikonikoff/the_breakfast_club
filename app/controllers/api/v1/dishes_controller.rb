class Api::V1::DishesController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
    if params[:search]
      render json: Dish.search(params[:search])
    else
      render json: Dish.all
    end
  end

  def show
    dish = Dish.find(params[:id])
    reviews = Review.where(dish_id: params[:id])
    render json: reviews
  end
end
