class Api::V1::DishesController < ApplicationController
  def index
    render json: Dish.all
  end

  def show
    dish = Dish.find(params[:id])
    reviews = Review.where(dish_id: params[:id])
    render json: reviews
  end
end
