class RegistrationsController < Devise::RegistrationsController

  def edit
    @user = current_user
  end

  def new
    @user = current_user
  end

  def after_update_path_for(resource)
    user_path(resource)
  end
end
