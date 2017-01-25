class Api::V1::VotesController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
    @votes = Votes.where(review_id: params([:review_id]))
    render json: @votes
  end
end
