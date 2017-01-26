class Api::V1::DishesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @dishes = Dish.all

    if params[:search]
      @dishes = Dish.search(params[:search])
    end

    render json: @dishes
  end
end
