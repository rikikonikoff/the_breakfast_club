class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
  end


  def destroy
    @user = User.find(params[:id])
    @user.destroy

    if @user.destroy
      redirect_to root_path, notice: "User deleted."
    end
  end
end
