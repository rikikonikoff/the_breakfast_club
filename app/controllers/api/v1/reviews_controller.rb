class Api::V1::ReviewsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
    render json: Review.where(dish_id: params[:dish_id])
  end

  def show
    review = Review.find(params[:id])
    reviewer = User.find(review.reviewer_id)
    render json: reviewer
  end
end
