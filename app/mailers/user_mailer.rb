class UserMailer < ApplicationMailer
  default from: 'breakfastclub.welcomer@example.com'

  def new_review(review)
    @dish = Dish.find(review.dish_id)
    @email = @dish.creator.email
    mail(
      to: @email,
      subject: 'Someone has reviewed your dish on The Breakfast Club!'
      )
  end
end
