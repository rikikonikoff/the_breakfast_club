require 'rails_helper'

RSpec.feature "user can create a new dish" do
  scenario "user is not signed in" do

    visit root_path
    click_link "Add a New Dish"
    expect(page).to have_content "You need to sign in or sign up before continuing"
  end

  scenario "user is signed in and creates a dish successfully" do
    user = FactoryGirl.create(:user)

    visit root_path
    login_as(user, :scope => :user, :run_callbacks => false)
    click_link "Add a New Dish"
    fill_in "Name", with: "Coffee"
    fill_in "Description", with: "Nectar of the gods"

    expect(page).to have_content "Dish added successfully"
    expect(page).to have_content "Coffee"
    expect(page).to have_content "Nectar of the gods"
    expect(page).to have_content user.username
  end

  scenario "user does not enter a name when submitting a dish" do
    user = FactoryGirl.create(:user)

    visit root_path
    login_as(user, :scope => :user, :run_callbacks => false)
    click_link "Add a New Dish"
    fill_in "Description", with: "Tom loves this breakfast"

    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content user.username
  end

  scenario "user does not enter a description when submitting a dish" do
    user = FactoryGirl.create(:user)

    visit root_path
    login_as(user, :scope => :user, :run_callbacks => false)
    click_button "Add a New Dish"
    fill_in "Name", with: "Pancakes"

    expect(page).to have_content "Dish added successfully"
    expect(page).to have_content "Pancakes"
    expect(page).to have_content user.username
  end
end
