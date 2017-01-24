class DishesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @dishes = Dish.all

    if params[:search]
      @dishes = Dish.search(params[:search].downcase)
      if @dishes.empty?
        flash[:notice] = "There are no dishes containing the term #{params[:search]}"
      end
    end
  end

  def show
    @id = params[:id]
    @dish = Dish.find(params[:id])
    @reviews = @dish.reviews
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

  def edit
    @dish = Dish.find(params[:id])
    @creator = @dish.creator
    if current_user != @creator
      flash[:notice] = "Sorry, you can't edit somone else's dish!"
      redirect_to @dish
    end
  end

  def update
    @dish = Dish.find(params[:id])
    @creator = @dish.creator
    if @dish.save
      flash[:notice] = "Dish updated successfully"
      redirect_to @dish
    else
      flash[:notice] = @dish.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @dish = Dish.find(params[:id])
    @reviews = @dish.reviews
    if current_user.admin? || (current_user == @dish.creator)
      @dish.destroy
      flash[:notice] = "Dish deleted"
      redirect_to dishes_path
    else
      flash[:notice] = "Sorry, you can't delete someone else's dish!"
      render :show
    end
  end

  private

  def dish_params
    params.require(:dish).permit(:name, :description, :creator_id).merge(
      creator: current_user)
  end
end
