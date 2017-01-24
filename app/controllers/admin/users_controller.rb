class Admin::UsersController < ApplicationController
  before_action :authenticate_user!, :is_admin?

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])

    @user.destroy
    flash[:notice] = "User deleted"
    redirect_to admin_users_path
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
