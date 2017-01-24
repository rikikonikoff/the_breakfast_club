require "spec_helper"

# Acceptance Criteria:
# * As a signed in user, I click "Sign Out" on the dishes index page
# * I am redirected to the landing page
# * I see a flash notice that says "You have successfully signed out"

feature "user signs out", %{
  As an registered and authenticated user
  I want to sign out
  To protect my identity
} do
  scenario "authenticated user signs out" do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"

    expect(page).to have_content("Sign Out")

    click_link "Sign Out"
    expect(page).to have_content("Signed out successfully")
  end

  scenario "unauthenticated user attempts to sign out" do
    visit dishes_path
    expect(page).to_not have_content("Sign Out")
  end
end
