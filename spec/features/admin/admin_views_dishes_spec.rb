require 'rails_helper'

# Acceptance Criteria
#  * Admin has access to an index page of dishes
#  * Admin can delete anyone's dish
#  * Admin can delete anyone's review
#  * Non-admin users cannot access these functions

RSpec.feature "admin can see all of the dishes", %{
  As an admin,
  I want to delete dishes and reviews,
  so that I can get rid of inappropriate ones } do
  scenario "admin views a list of dishes" do
    admin = FactoryGirl.create(:user, admin: true)
    dish_1 = FactoryGirl.create(:dish)
    dish_2 = FactoryGirl.create(:dish)

    login_as(admin)
    visit admin_dishes_path

    expect(page).to have_content dish_1.name
    expect(page).to have_content dish_2.name
  end

  scenario "admin views a dish show page" do
    admin = FactoryGirl.create(:user, admin: true)
    dish_1 = FactoryGirl.create(:dish)
    dish_2 = FactoryGirl.create(:dish)

    login_as(admin)
    visit admin_dishes_path
    click_link dish_1.name

    expect(page).to have_content dish_1.name
    expect(page).to have_content dish_1.description
    expect(page).to have_link "Delete this Dish"

    expect(page).to_not have_content dish_2.name
  end

  scenario "admin deletes a dish" do
    admin = FactoryGirl.create(:user, admin: true)
    dish = FactoryGirl.create(:dish)

    login_as(admin)
    visit admin_dishes_path
    click_link dish.name
    click_link "Delete this Dish"

    expect(page).to have_content "Dish deleted"
  end

  scenario "admin deletes a review" do
    admin = FactoryGirl.create(:user, admin: true)
    dish = FactoryGirl.create(:dish)
    review_1 = FactoryGirl.create(:review, dish: dish)

    login_as(admin)
    visit admin_dishes_path
    click_link dish.name
    click_link "Delete this Review"

    expect(page).to have_content "Review deleted"
    expect(page).to_not have_content review_1.body
  end

  scenario "non-admin tries to delete a dish that they didn't create" do
    user = FactoryGirl.create(:user)
    user_2 = FactoryGirl.create(:user)
    dish = FactoryGirl.create(:dish, creator: user_2)

    login_as(user)
    visit dish_path(dish)
    click_button "Delete this Dish"

    expect(page).to have_content "Sorry, you can't delete someone else's dish"
  end

  scenario "non-admin tries to delete a review that they didn't write" do
    user = FactoryGirl.create(:user)
    user_2 = FactoryGirl.create(:user)
    dish = FactoryGirl.create(:dish, creator: user_2)
    review = FactoryGirl.create(:review, dish: dish, reviewer: user)

    login_as(user_2)
    visit dish_path(dish)
    click_button "Delete this Review"

    expect(page).to have_content "Sorry, you can't delete someone else's review"
  end
end
