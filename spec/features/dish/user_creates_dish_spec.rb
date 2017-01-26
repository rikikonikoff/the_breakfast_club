require 'rails_helper'

# Acceptance Criteria:
# * I click "Add a New Dish" on the dishes index page
# * I am presented with a form requesting dish name and description
# * I click button "Add Dish"
# * I see my dish on it's own show page
# * On the dishes index page, I see my dish added to the list of dishes

RSpec.feature "user can create a new dish", %{
  As a registered and authenticated user
  I want to create a new dish
  To share my thoughts
  } do
  scenario "user is not signed in" do

    visit dishes_path
    click_link "Add a New Dish"
    expect(page).to have_content "You need to sign in or sign up before continuing"
  end

  xscenario "user is signed in and creates a dish successfully" do
    user = FactoryGirl.create(:user)

    visit dishes_path
    login_as(user, :scope => :user, :run_callbacks => false)
    click_link "Add a New Dish"
    fill_in "Name", with: "Coffee"
    fill_in "Description", with: "Nectar of the gods"
    attach_file "Image", "#{Rails.root}/spec/fixtures/myfiles/omom.jpg"
    find(:css, '#choose-file').click
    click_button "Submit Dish"
    save_and_open_page

    expect(page).to have_content "Dish added successfully"
    expect(page).to have_content "Coffee"
    expect(page).to have_content "Nectar of the gods"
    expect(page).to have_content user.username
    expect(page).to have_content("img[src*='omom.jpg']")

  end

  scenario "user does not enter a name when submitting a dish" do
    user = FactoryGirl.create(:user)

    visit dishes_path
    login_as(user, :scope => :user, :run_callbacks => false)
    click_link "Add a New Dish"
    fill_in "Description", with: "Tom loves this breakfast"
    click_button "Submit Dish"

    expect(page).to have_content "Name can't be blank"
  end

  scenario "user does not enter a description when submitting a dish" do
    user = FactoryGirl.create(:user)

    visit dishes_path
    login_as(user, :scope => :user, :run_callbacks => false)
    click_link "Add a New Dish"
    fill_in "Name", with: "Pancakes"
    click_button "Submit Dish"

    expect(page).to have_content "Dish added successfully"
    expect(page).to have_content "Pancakes"
    expect(page).to have_content user.username
  end
end
