require 'rails_helper'

# Acceptance Criteria:
# * User can edit their own reviews
# * User cannot edit others' reviews

RSpec.feature "user can edit reviews", %{
  As a user
  I want to edit my reviews
  So I can fix my typos or changed opinions
 } do
   scenario "user edits a review they created" do
     user = FactoryGirl.create(:user)
     dish = FactoryGirl.create(:dish)
     review = FactoryGirl.create(:review, dish: dish, reviewer: user)

     login_as(user)
     visit dish_path(dish)
     click_link "Edit this Review"

     expect(page).to have_content "Rating"
     expect(page).to have_content "comments on your rating"
   end

   scenario "user tries to edit a review they did not create" do
    user = FactoryGirl.create(:user)
    user_2 = FactoryGirl.create(:user)
    dish = FactoryGirl.create(:dish)
    review = FactoryGirl.create(:review, dish: dish, reviewer: user)

    login_as(user_2)
    visit dish_path(dish)
    click_link "Edit this Review"

    expect(page).to have_content "Sorry, you can't edit someone else's review!"
    expect(page).to_not have_content "Rating"
    expect(page).to_not have_content "comments on your rating"
   end
 end
