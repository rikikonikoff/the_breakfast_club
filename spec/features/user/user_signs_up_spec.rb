require "rails_helper"

feature "user registers", %{
  As a user, I want to register so that I can create an account
} do

  scenario "provide valid registration information" do
    visit new_user_registration_path

    fill_in "Email", with: "thomas12345@example.com"
    fill_in "user_password", with: "password12345"
    fill_in "user_password_confirmation", with: "password12345"
    fill_in "Username", with: "Thomas12345"

    click_button "Sign up"
    user = User.last

    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(page).to have_content("Sign Out")
  end

  scenario "provide invalid registration information" do
    visit new_user_registration_path

    click_button "Sign up"

    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content("Sign Out")
  end

  xscenario 'user uploads profile photo' do
    visit new_user_registration_path

    fill_in "Email", with: "thomas12345@example.com"
    fill_in "user_password", with: "password12345"
    fill_in "user_password_confirmation", with: "password12345"
    fill_in "Username", with: "Thomas12345"
    attach_file "Avatar", "#{Rails.root}/spec/fixtures/myfiles/pizza_party.png"

    click_button "Sign up"

    expect(page).to have_css("img[src*='pizza_party.png']")
  end
end
