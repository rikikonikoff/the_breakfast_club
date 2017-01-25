require 'rails_helper'

# Acceptance Criteria
# * User can click 'Likey' or 'Dislikey' for each review
# * User can change their vote
# * User can only have one vote per review

RSpec.feature %{
  As a user
  I want to vote on a review
  To show others what I think of it
  } do

  xscenario "user likes a review" do
    dish = FactoryGirl.create(:dish)
    review = FactoryGirl.create(:review, dish: dish)

    visit dish_path(dish)
    click_button 'Likey'

    expect(page).to have_content "Review Liked"
  end

  xscenario "user dislikes a review" do
    dish = FactoryGirl.create(:dish)
    review = FactoryGirl.create(:review, dish: dish)

    visit dish_path(dish)
    click_button 'Dislikey'

    expect(page).to have_content "Review Disliked"
  end

  xscenario "user tries to like or dislike a review more than once" do
    dish = FactoryGirl.create(:dish)
    review = FactoryGirl.create(:review, dish: dish)

    visit dish_path(dish)
    click_button 'Likey'
    click_button 'Likey'

    expect(page).to have_content "You already like this review"
  end

  xscenario "user changes his or her vote" do
    dish = FactoryGirl.create(:dish)
    review = FactoryGirl.create(:review, dish: dish)

    visit dish_path(dish)
    click_button 'Likey'
    click_button 'Dislikey'

    expect(page).to_not have_content "Review Liked"
    expect(page).to have_content "Review Disliked"
  end
end
