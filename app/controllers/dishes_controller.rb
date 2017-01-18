class DishesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @dishes = Dish.all
  end

  def show
    @dish = Dish.find(params[:id])
  end

  def new
    @dish = Dish.new
  end

  def create
    @dish = Dish.new(dish_params)
    @creator = current_user
    @dish.creator = @creator
    if @dish.save
      flash[:notice] = "Dish added successfully"
      redirect_to @dish
    else
      flash[:notice] = @dish.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def dish_params
    params.require(:dish).permit(:name, :description, :creator_id)
  end
end
