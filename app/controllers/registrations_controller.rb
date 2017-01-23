class RegistrationsController < Devise::RegistrationsController

  def edit
    @user = current_user
  end

  def update
    @user = current_user
  end

  def create
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def after_update_path_for(resource)
    user_path(resource)
  end
end
