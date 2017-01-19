class VotesController < ApplicationController
  before_action :authenticate_user!

  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new
    @review = Review.find(params[:review_id])
    @dish = Dish.find(params[:dish_id])
    @user = current_user
  end

  def edit
    @vote = Vote.find(vote_params)
    @review = Review.find(params[:review_id])
    @dish = Dish.find(params[:dish_id])
    @user = current_user
  end

  def update
    @vote = Vote.find(vote_params)
    @review = Review.find(params[:review_id])
    @dish = Dish.find(params[:dish_id])
    @user = current_user
  end

  def destroy
    @vote = Vote.find(vote_params)
    @review = Review.find(params[:review_id])
    @dish = Dish.find(params[:dish_id])
    @user = current_user
  end

  private

  def vote_params
    params.require(:vote).permit(:vote_value, :user_id, :review_id)
  end
end
