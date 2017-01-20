class Api::V1::ReviewsController < ApplicationController
  def index
    render json: Review.where(dish_id: params[:dish_id])
  end

  def show
    review = Review.find(params[:id])
    reviewer = User.find(review.reviewer_id)
    render json: reviewer
  end
end
