require 'rails_helper'

RSpec.feature "user can create a new review" do
  xscenario "user is not signed in" do
    user = FactoryGirl.create(:user)
    dish = FactoryGirl.create(:dish)

    logout(:user)
    visit dish_path(dish)
    click_link "Review this Dish"
    expect(page).to have_content "You need to sign in or sign up before continuing"
  end

  xscenario "user is signed in and creates a review successfully" do
    user = FactoryGirl.create(:user)
    dish = FactoryGirl.create(:dish)

    visit dish_path(dish)
    login_as(user, :scope => :user, :run_callbacks => false)
    click_link "Review this Dish"
    fill_in "Rating", with: "4"
    fill_in "comments on your rating", with: "This place is pretty rad"
    click_button "Review #{dish.name}"

    expect(page).to have_content "Review added successfully"
    expect(page).to have_content "4"
    expect(page).to have_content "This place is pretty rad"
    expect(page).to have_content user.username
  end

  xscenario "user does not enter a rating when submitting a review" do
    user = FactoryGirl.create(:user)
    dish = FactoryGirl.create(:dish)

    visit dish_path(dish)
    login_as(user, :scope => :user, :run_callbacks => false)
    click_link "Review this Dish"
    fill_in "comments on your rating", with: "I love this for breakfast!"
    click_button "Review #{dish.name}"

    expect(page).to have_content "Rating can't be blank"
  end

  xscenario "user does not enter a body when submitting a review" do
    user = FactoryGirl.create(:user)
    dish = FactoryGirl.create(:dish)

    visit dish_path(dish)
    login_as(user, :scope => :user, :run_callbacks => false)
    click_link "Review this Dish"
    fill_in "Rating", with: "5"
    click_button "Review #{dish.name}"

    expect(page).to have_content "Review added successfully"
    expect(page).to have_content "5"
    expect(page).to have_content user.username
  end
end
