class Admin::DishesController < ApplicationController
  before_action :authenticate_user!, :is_admin?

  def index
    @dishes = Dish.all
  end

  def show
    @dish = Dish.find(params[:id])
    @reviews = @dish.reviews
  end

  def destroy
    @dish = Dish.find(params[:id])

    @dish.destroy
    flash[:notice] = "Dish deleted"
    redirect_to admin_dishes_path
  end

  private

  def is_admin?
    if current_user.admin?
      true
    else
      flash[:notice] = "Sorry, you don't have access to that feature!"
    end
  end
end
