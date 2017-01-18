require 'rails_helper'

feature "user views dishes" do
  let(:user) do
    FactoryGirl.create(:user)
  end
  let(:dish_1) do
    FactoryGirl.create(:dish, creator: user)
  end
  let(:dish_2) do
    FactoryGirl.create(:dish, creator: user)
  end
  let(:dish_3) do
    FactoryGirl.create(:dish, creator: user)
  end

  scenario "user views a list of dishes on index page successfully" do
    visit root_path

    expect(page).to have_content dish_1.name
    expect(page).to have_content dish_2.name
    expect(page).to have_content dish_3.name

    expect(page).to_not have_content dish_1.description
    expect(page).to_not have_content dish_2.description
    expect(page).to_not have_content dish_3.description
  end

  scenario "user sees show page after clicking on a dish" do
    visit root_path
    click_link dish_1.name

    expect(page).to have_content dish_1.name
    expect(page).to have_content dish_1.description

    expect(page).to_not have_content dish_2.name
  end

  # scenario "user does not see a list of dishes on index page" do
  #
  # end
  #
  # scenario "user does not see show page after clicking on a dish" do
  #
  # end
end
