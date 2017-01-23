require "rails_helper"

# Acceptance Criteria:
# * I click "Sign In" on the dishes index page
# * I am presented with a form requesting email and password
# * My password is not displayed as I enter it
# * I must specify a valid email and password
# * If i enter invalid information, I will receive a prompt to enter correct information
# * If I'm already signed in, I don't have the option to Sign In

feature "user signs in", %{
  As a registered and unauthenticated user
  I want to sign in
  So that I can access my account
} do

  scenario "specify valid credentials" do
    user = FactoryGirl.create(:user)
    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"

    expect(page).to have_content("Sign Out")
  end

  scenario "specify invalid credentials" do
    visit new_user_session_path

    click_button "Log in"
    expect(page).to have_content("Invalid Email or password")
    expect(page).to_not have_content("Sign Out")
  end
end
