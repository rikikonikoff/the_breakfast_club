require 'rails_helper'

# Acceptance Criteria
# * User can click "Like" or "Dislike" for each review
# * User can change their vote
# * User can only have one vote per review

RSpec.feature %{
  As a user
  I want to vote on a review
  To show others what I think of it
  } do

  scenario "user likes a review" do
    dish = FactoryGirl.create(dish)
    review = FactoryGirl.create(review, dish: dish)

    visit dish_path(dish)
    click_link "Like"

    expect(page).to have_content "Review Liked"
  end

  scenario "user dislikes a review" do
    dish = FactoryGirl.create(dish)
    review = FactoryGirl.create(review, dish: dish)

    visit dish_path(dish)
    click_link "Dislike"

    expect(page).to have_content "Review Disliked"
  end

  scenario "user tries to like or dislike a review more than once" do
    dish = FactoryGirl.create(dish)
    review = FactoryGirl.create(review, dish: dish)

    visit dish_path(dish)
    click_link "Like"
    click_link "Like"

    expect(page).to have_content "You already like this review"
  end

  scenario "user changes his or her vote" do
    dish = FactoryGirl.create(dish)
    review = FactoryGirl.create(review, dish: dish)

    visit dish_path(dish)
    click_link "Like"
    click_link "Dislike"

    expect(page).to_not have_content "Review liked"
    expect(page).to have_content "Review disliked"
  end
end
