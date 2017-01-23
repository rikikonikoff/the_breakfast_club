require "rails_helper"

# Acceptance Criteria:
# * On my user account page, I see an "Edit my account!" button
# * If I click "Edit my account!", I am redirected to an edit page
# * I see a button that says "Cancel my account"
# * If I click "Cancel my account", I get an "are you sure?" prompt.
# * If I confirm, I receive a message saying "Your account has been successfully cancelled"
# * I can no longer Sign In without registering as a new user

feature "user deletes account", %{
  As a registered and unauthenticated user
  I want to delete my account
  If I am unsatisfied
} do

  scenario "delete account" do
    visit new_user_registration_path

    fill_in "Email", with: "thomas12345@example.com"
    fill_in "user_password", with: "password12345"
    fill_in "user_password_confirmation", with: "password12345"
    fill_in "Username", with: "Thomas12345"

    click_button "Sign up"
    user = User.last

    click_link "thomas12345@example.com"

    click_button "Edit my account!"
    user = User.last

    click_button "Cancel my account"

    expect(page).to have_content("Your account has been successfully cancelled")
  end

end
