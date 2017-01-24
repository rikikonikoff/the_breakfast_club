class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @review = Review.new
    @dish = Dish.find(params[:dish_id])
  end

  def create
    @dish = Dish.find(params[:dish_id])
    @reviewer = current_user
    @review = Review.new(review_params)
    @review.reviewer_id = @reviewer.id
    if @review.save
      UserMailer.new_review(@review).deliver_now
      flash[:notice] = "Review added successfully"
      redirect_to dish_path(@dish)
    else
      flash[:notice] = @review.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(
      :rating,
      :body,
      :reviewer_id,
      :dish_id,
      :upvote_count,
      :downvote_count,
      :net_votes,
      :votes
    ).merge(
      dish: Dish.find(params[:dish_id]),
      reviewer: current_user
    )
  end
end
