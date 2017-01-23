require 'rails_helper'

# Acceptance Criteria:
# * User can search for a dish
# * If the dish exists in the database, it should show up
# * If the dish does not yet exist in the database, it should not show up
# * If a dish does not match the search criteria, it should not show up
# * if there are no matching dishes, an error should appear

RSpec.feature "searchbar", %{
  As a user
  I want to search for a dish
  To see if it is up on the website yet
  } do

  scenario "user searches for a word contained in a dish" do
    dish_1 = FactoryGirl.create(:dish, name: "eggs benedict")
    dish_2 = FactoryGirl.create(:dish, name: "pancakes")

    visit dishes_path
    fill_in :search, with: "eggs"
    click_button "Search"

    expect(page).to have_content dish_1.name
    expect(page).to_not have_content dish_2.name
  end

  scenario "user searches for a word not found in dishes names" do
    dish = FactoryGirl.create(:dish, name: "eggs benedict")

    visit dishes_path
    fill_in :search, with: "french toast"
    click_button "Search"

    expect(page).to_not have_content dish.name
    expect(page).to have_content "There are no dishes containing the term french toast"
  end
end
