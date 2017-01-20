require 'rails_helper'

feature "user views reviews for a given dish" do
  xscenario "user sees a list of reviews on the dish's show page" do
    user = FactoryGirl.create(:user)
    dish_1 = FactoryGirl.create(:dish)
    dish_2 = FactoryGirl.create(:dish)
    review_1 = FactoryGirl.create(:review)
    review_2 = FactoryGirl.create(:review, rating: 4)

    visit dish_path(review_1.dish_id)

    expect(page).to have_content review_1.rating
    expect(page).to have_content review_1.body


    expect(page).to_not have_content review_2.rating
  end

  xscenario "user can upvote or downvote a review" do
    review = FactoryGirl.create(:review)

    visit dish_path(review.dish)

    expect(page).to have_button "Like"
    expect(page).to have_button "Dislike"
  end
end
