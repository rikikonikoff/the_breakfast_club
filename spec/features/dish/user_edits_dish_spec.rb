require 'rails_helper'

# Acceptance Criteria:
# * User can edit their own dishes
# * User cannot edit others' dishes

RSpec.feature "user can edit dishes", %{
  As a user
  I want to edit my dishes
  So I can fix my typos
 } do
   scenario "user edits a dish they created" do
    user = FactoryGirl.create(:user)
    dish = FactoryGirl.create(:dish, creator: user)

    login_as(user)
    visit dish_path(dish)
    click_button "Edit this Dish"
    fill_in "Name", with: "french toast"
    fill_in "Description", with: "sometimes dry"
    click_button "Submit Dish"

    expect(page).to have_content "french toast"
    expect(page).to have_content "sometimes dry"
   end

   scenario "user tries to edit a dish they did not create" do
    user = FactoryGirl.create(:user)
    user_2 = FactoryGirl.create(:user)
    dish = FactoryGirl.create(:dish, creator: user)

    login_as(user_2)
    visit dish_path(dish)
    click_button "Edit this Dish"

    expect(page).to have_content "Sorry, you can't edit somone else's dish!"
   end
 end
