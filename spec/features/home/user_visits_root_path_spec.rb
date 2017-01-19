require "rails_helper"

feature "user visits root path", %{
  As a user, I want to visit the landing page and click 'enter' to enter
} do
    scenario "user visits root path" do
    user = FactoryGirl.create(:user)
    visit root_path

    expect(page).to have_content("enter")

    click_link("enter")

    expect(page).to have_content("Sign In")
  end
end
