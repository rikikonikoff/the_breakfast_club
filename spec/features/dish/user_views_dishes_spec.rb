require 'rails_helper'

# Acceptance Criteria:
# * I Sign In and visit the dishes index page
# * I am presented with a list of dishes
# * Each dish has a title and description

feature "user views dishes", %{
  As a registerd and authenticated user
  I want to view a list of dishes
  So that I can get breakfast ideas
  } do
  xscenario "user sees a list of dishes on the index page" do
    user = FactoryGirl.create(:user)
    dish_1 = FactoryGirl.create(:dish)
    dish_2 = FactoryGirl.create(:dish)
    dish_3 = FactoryGirl.create(:dish)

    visit dishes_path

    expect(page).to have_content dish_1.name
    expect(page).to have_content dish_2.name
    expect(page).to have_content dish_3.name

    expect(page).to_not have_content dish_1.description
    expect(page).to_not have_content dish_2.description
    expect(page).to_not have_content dish_3.description
  end

  xscenario "user sees show page after clicking on a dish" do
    user = FactoryGirl.create(:user)
    dish_1 = FactoryGirl.create(:dish)
    dish_2 = FactoryGirl.create(:dish)

    visit dishes_path
    click_link dish_1.name

    expect(page).to have_content dish_1.name
    expect(page).to have_content dish_1.description
    expect(page).to have_content dish_1.creator.username
    expect(page).to have_css("img[src*='omom.jpg']")

    expect(page).to_not have_content dish_2.name
  end
end
