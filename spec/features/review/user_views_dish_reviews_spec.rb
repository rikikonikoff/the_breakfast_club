require 'rails_helper'

# Acceptance Criteria:
# * I visit a dish show page
# * I see a list of reviews of that dish

feature "user views reviews for a given dish", %{
  As a registered and authenticated user
  I want to view reviews of a dish
  To know whether or not it is worth my time
  } do
  scenario "user sees a list of reviews on the dish's show page" do
    user = FactoryGirl.create(:user)
    dish_1 = FactoryGirl.create(:dish)
    dish_2 = FactoryGirl.create(:dish)
    review_1 = FactoryGirl.create(:review)
    review_2 = FactoryGirl.create(:review, rating: 4)

    visit dish_path(review_1.dish_id)

    expect(page).to have_content review_1.rating
    expect(page).to have_content review_1.body


    expect(page).to_not have_content review_2.body
  end

  scenario "user can upvote or downvote a review" do
    review = FactoryGirl.create(:review)

    visit dish_path(review.dish)

    expect(page).to have_link "Like"
    expect(page).to have_link "Dislike"
  end
end
