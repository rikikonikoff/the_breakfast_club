require 'rails_helper'

# Acceptance Criteria
#  * Admin has access to an index page of users
#  * Admin can delete a user
#  * Non-admin users cannot view the admin pages

RSpec.feature "admin can see all of the users", %{
  As an admin,
  I want to have control over the users of my site,
  so that I can delete users if I choose to } do

  scenario "admin views a list of users" do
    user_1 = FactoryGirl.create(:user, admin: true)
    user_2 = FactoryGirl.create(:user)

    login_as(user_1)
    visit admin_users_path

    expect(page).to have_content user_1.username
    expect(page).to have_content user_2.username
  end

  scenario "admin deletes a user" do
    user_1 = FactoryGirl.create(:user, admin: true)
    user_2 = FactoryGirl.create(:user)

    login_as(user_1)
    visit admin_users_path

    click_button "Delete #{user_2.username}'s Account"
    expect(page).to have_content "User deleted"
    expect(page).to_not have_content user_2.username
  end

  scenario "non-admin tries to access admin users index" do
    user_1 = FactoryGirl.create(:user, admin: true)
    user_2 = FactoryGirl.create(:user)

    login_as(user_2)
    visit dishes_path
    click_link "Admin"

    expect(page).to have_content "Sorry, you don't have access to that feature!"
  end
end
