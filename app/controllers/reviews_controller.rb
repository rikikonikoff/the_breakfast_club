class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

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

  def edit
    @review = Review.find(params[:id])
    @dish = @review.dish
    @reviewer = @review.reviewer
    if current_user != @reviewer
      flash[:notice] = "Sorry, you can't edit someone else's review!"
      redirect_to @dish
    end
  end

  def update
    @review = Review.find(params[:id])
    @dish = @review.dish
    @reviewer = @review.reviewer
    if @review.update(review_params)
      flash[:notice] = "Review updated successfully"
      redirect_to @dish
    else
      flash[:notice] = @review.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @dish = Dish.find(params[:dish_id])
    @review = Review.find(params[:id])
    if current_user.admin? || (current_user == @review.reviewer)
      @review.destroy
      flash[:notice] = "Review deleted"
    else
      flash[:notice] = "Sorry, you can't delete someone else's review!"
    end
    redirect_to dish_path(@dish)
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
