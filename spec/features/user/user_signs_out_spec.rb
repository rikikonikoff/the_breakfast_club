require "spec_helper"

feature "user signs out", %{
  As an authenticated user, I want to sign out
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
