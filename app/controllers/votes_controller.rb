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

    if @vote.save
      if @vote.vote_value == 1
        @review.upvote_count += 1
      elsif @vote.vote_value == -1
        @review.downvote_count += 1
      end

      @review.net_votes = @vote.upvote_count - @vote.downvote_count
      redirect_to @dish
    else
      flash[:notice] = @vote.errors.full_messages.to_sentence
      render :new
    end
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

    if @user == @vote.user
      if @vote.vote_value == 1
        @review.upvote_count -= 1
      elsif @vote.vote_value == -1
        @review.downvote_count -=1
      end

      @vote.vote_value = 0

      if @vote.save
        if @vote.vote_value == 1
          @review.upvote_count += 1
        elsif @vote.vote_value == -1
          @review.downvote_count += 1
        end

        @review.net_votes = @vote.upvote_count - @vote.downvote_count
        redirect_to @dish
      else
        flash[:notice] = @vote.errors.full_messages.to_sentence
        render :edit
      end
    else
      flash[:notice] = "You can't change someone else's vote"
    end
  end

  def destroy
    @vote = Vote.find(vote_params)
    @review = Review.find(params[:review_id])
    @dish = Dish.find(params[:dish_id])
    @user = current_user
    
    if @user == @vote.user
      if @vote.vote_value == 1
        @review.upvote_count -= 1
      elsif @vote.vote_value == -1
        @review.downvote_count -=1
      end

      @vote.destroy
      @review.net_votes = @vote.upvote_count - @vote.downvote_count
      redirect_to @dish
    else
      flash[:notice] = "You can't change someone else's vote"
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:vote_value, :user_id, :review_id)
  end
end
