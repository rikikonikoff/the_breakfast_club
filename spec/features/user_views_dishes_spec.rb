require 'rails_helper'

feature "user views dishes" do
  scenario "user sees a list of dishes on the index page" do
    user = FactoryGirl.create(:user)
    dish_1 = FactoryGirl.create(:dish, creator: user)
    dish_2 = FactoryGirl.create(:dish, creator: user)
    dish_3 = FactoryGirl.create(:dish, creator: user)

    visit dishes_path

    expect(page).to have_content dish_1.name
    expect(page).to have_content dish_2.name
    expect(page).to have_content dish_3.name

    expect(page).to_not have_content dish_1.description
    expect(page).to_not have_content dish_2.description
    expect(page).to_not have_content dish_3.description
  end

  scenario "user sees show page after clicking on a dish" do
    user = FactoryGirl.create(:user)
    dish_1 = FactoryGirl.create(:dish, creator: user)
    dish_2 = FactoryGirl.create(:dish, creator: user)

    visit dishes_path
    click_link dish_1.name

    expect(page).to have_content dish_1.name
    expect(page).to have_content dish_1.description

    expect(page).to_not have_content dish_2.name
  end
end
