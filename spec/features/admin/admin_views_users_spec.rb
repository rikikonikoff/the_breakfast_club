require 'rails_helper'

# Acceptance Criteria
#  * Admin has access to an index page of users
#  * Admin can delete a user
#  * Non-admin users cannot view the admin pages

RSpec.feature "admin can see all of the users" %{
  As an admin,
  I want to have control over the users of my site,
  so that I can delete users if I choose to } do
  scenario "admin views a list of users" do

  end

  scenario "admin deletes a user" do

  end

  scenario "non-admin tries to access admin users index" do
    
  end
end
