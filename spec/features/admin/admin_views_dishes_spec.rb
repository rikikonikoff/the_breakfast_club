require 'rails_helper'

# Acceptance Criteria
#  * Admin has access to an index page of dishes
#  * Admin can delete anyone's dish
#  * Admin can delete anyone's review
#  * Non-admin users cannot access these functions

RSpec.feature "admin can see all of the dishes" %{
  As an admin,
  I want to delete dishes and reviews,
  so that I can get rid of inappropriate ones } do
  scenario "admin views a list of dishes" do

  end

  scenario "admin views a dish show page" do

  end

  scenario "admin deletes a dish" do

  end

  scnenario "admin deletes a review" do

  end

  scenario "non-admin tries to delete a dish that they didn't create" do

  end

  scenario "non-admin tries to delete a review that they didn't write" do

  end
end
