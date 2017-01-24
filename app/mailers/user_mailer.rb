class UserMailer < ApplicationMailer
  default from: 'breakfastclub.welcomer@gmail.com'

  def new_review(user)
    @user = User.find(params[:id])
    @url = 'http://localhost:3000'
    mail(to: @user.email, subject: 'Welcome to The Breakfast Club!')
  end

end
