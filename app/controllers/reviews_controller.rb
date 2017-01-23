class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @review = Review.new
    @dish = Dish.find(params[:dish_id])
  end

  def create
    @dish = Dish.find(params[:dish_id])
    @review = Review.new(review_params)
    if @review.save
      WelcomeMailer.new_review(@review).deliver_later
      flash[:notice] = "Review added successfully"
      redirect_to @dish
    else
      flash[:notice] = @review.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body, :upvote_count, :downvote_count, :net_votes, :votes).merge(
      dish: Dish.find(params[:dish_id]),
      reviewer: User.find(current_user.id))
  end
end
