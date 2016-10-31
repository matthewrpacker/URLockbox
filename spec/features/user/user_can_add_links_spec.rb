require 'rails_helper'

RSpec.feature "User Can Add Links", type: :feature do
  scenario "with valid information" do
    user = User.create(email: "matt@example.com", password: "password", password_confirmation: "password")

    visit login_path

    fill_in "Email", with: "matt@example.com"
    fill_in "Password", with: "password"
    fill_in "Password Confirmation", with: "password"
    click_on "Submit"

    expect(current_path).to eq(user_links_path(user))

    fill_in "Title", with: "Google"
    fill_in "URL", with: "www.google.com"
    click_on "Submit"

    expect(page).to have_content("Google")
    expect(page).to have_content("www.google.com")
  end
end
