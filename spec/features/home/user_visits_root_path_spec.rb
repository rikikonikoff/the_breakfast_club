require "rails_helper"

# Acceptance Criteria:
# * I visit the homes index landing page
# * I am presented with an "enter" link
# * I am redirected to the dishes index page

feature "user visits root path", %{
  As a visitor
  I want to visit the landing page
  And click "enter" to view the site
} do
    scenario "user visits root path" do
    user = FactoryGirl.create(:user)
    visit root_path

    expect(page).to have_content("enter")

    click_link("enter")

    expect(page).to have_content("Sign In")
  end
end
