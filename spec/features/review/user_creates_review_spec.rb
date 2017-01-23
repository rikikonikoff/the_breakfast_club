require 'rails_helper'

# Acceptance Criteria:
# * I visit a dish show page
# * I see a button "Add a Review"
# * I click "Add a Review"
# * I am presented with a form requesting a rating and review
# * If I enter invalid information, I will receive a prompt to enter correct information
# * If I enter valid information and click "Add Review", I am redirected to the dish show page
# * I see my review under the dish

RSpec.feature "user can create a new review", %{
  As a registered and authenticated user
  I want to create a review
  To share my thoughts about a particular dish
  } do
  scenario "user is not signed in" do
    user = FactoryGirl.create(:user)
    dish = FactoryGirl.create(:dish)

    logout(:user)
    visit dish_path(dish)
    click_link "Review this Dish"
    expect(page).to have_content "You need to sign in or sign up before continuing"
  end

  scenario "user is signed in and creates a review successfully" do
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

  scenario "user does not enter a rating when submitting a review" do
    user = FactoryGirl.create(:user)
    dish = FactoryGirl.create(:dish)

    visit dish_path(dish)
    login_as(user, :scope => :user, :run_callbacks => false)
    click_link "Review this Dish"
    fill_in "comments on your rating", with: "I love this for breakfast!"
    click_button "Review #{dish.name}"

    expect(page).to have_content "Rating can't be blank"
  end

  scenario "user does not enter a body when submitting a review" do
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
