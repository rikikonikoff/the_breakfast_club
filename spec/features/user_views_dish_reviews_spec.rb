require 'rails_helper'

feature "user views reviews for a given dish" do
  scenario "user sees a list of reviews on the dish's show page" do
    user = FactoryGirl.create(:user)
    dish_1 = FactoryGirl.create(:dish)
    dish_2 = FactoryGirl.create(:dish)
    review_1 = FactoryGirl.create(:review, dish: dish_1)
    review_2 = FactoryGirl.create(:review, dish: dish_2)

    visit dish_path(dish_1)

    expect(page).to have_content review_1.rating
    expect(page).to have_content review_1.body

    expect(page).to_not have_content review_2.rating
  end

  scenario "user can upvote or downvote a review" do
    user = FactoryGirl.create(:user)
    dish = FactoryGirl.create(:dish)
    review_1 = FactoryGirl.create(:review, dish: dish)
    review_2 = FactoryGirl.create(:review, dish: dish)

    visit dish_path(dish)

    expect(page).to have_content "Like"
    expect(page).to have_content "Dislike"
  end
end
