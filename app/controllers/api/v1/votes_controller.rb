class Api::V1::VotesController < ApplicationController
  def index
    @votes = Votes.where(review_id: params([:review_id]))
    render json: @votes
  end
end
