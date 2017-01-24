require "rails_helper"

RSpec.feature "dish creator gets emails when dish is reviewed" do
  scenario "someone reviews a dish" do
    dish = FactoryGirl.create(:dish)
    creator = dish.creator

    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user, :run_callbacks => false)

    visit dish_path(dish)
    click_button "Review this Dish"
    fill_in "Rating", with: "4"
    fill_in "comments on your rating", with: "This dish is pretty rad"
    click_button "Review #{dish.name}"

    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end
