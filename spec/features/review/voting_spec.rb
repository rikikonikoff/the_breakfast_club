require 'rails_helper'

# Acceptance Criteria
# * User can click 'Like' or 'Dislike' for each review
# * User can change their vote
# * User can only have one vote per review

feature 'user upvotes and downvotes', %{
  As a user
  I want to vote on a review
  To show others what I think of it
  } do

  scenario "user upvotes a review" do
    user7 = FactoryGirl.create(:user)
    dish = FactoryGirl.create(:dish, creator: user7)
    review = FactoryGirl.create(:review, reviewer: user7, dish: dish)

    visit new_user_session_path

    fill_in "Email", with: user7.email
    fill_in "Password", with: user7.password
    click_button "Log in"

    visit dish_path(dish)

    click_button 'Like'

    expect(page).to have_content '1'
  end

  scenario "user downvotes a review" do
    user7 = FactoryGirl.create(:user)
    dish = FactoryGirl.create(:dish, creator: user7)
    review = FactoryGirl.create(:review, reviewer: user7, dish: dish)

    visit new_user_session_path

    fill_in "Email", with: user7.email
    fill_in "Password", with: user7.password
    click_button "Log in"

    visit dish_path(dish)

    click_button 'Dislike'

    expect(page).to have_content '-1'
  end

  scenario "user changes his or her vote" do
    user7 = FactoryGirl.create(:user)
    dish = FactoryGirl.create(:dish, creator: user7)
    review = FactoryGirl.create(:review, reviewer: user7, dish: dish)

    visit new_user_session_path

    fill_in "Email", with: user7.email
    fill_in "Password", with: user7.password
    click_button "Log in"

    visit dish_path(dish)
    click_button 'Like'

    visit dish_path(dish)
    click_button 'Dislike'

    expect(page).to have_content '-1'
  end

  scenario "user deletes vote" do
    user7 = FactoryGirl.create(:user)
    dish = FactoryGirl.create(:dish, creator: user7)
    review = FactoryGirl.create(:review, reviewer: user7, dish: dish)

    visit new_user_session_path

    fill_in "Email", with: user7.email
    fill_in "Password", with: user7.password
    click_button "Log in"

    visit dish_path(dish)
    click_button 'Like'

    visit dish_path(dish)
    click_button 'Like'

    expect(page).to have_content '0'
  end
end
