require "rails_helper"

feature "user deletes account", %{
  As a user, I want to delete my account
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

    click_button "Destroy my account!"
    user = User.last

    expect(page).to have_content("Your account has been successfully cancelled")
  end

end
