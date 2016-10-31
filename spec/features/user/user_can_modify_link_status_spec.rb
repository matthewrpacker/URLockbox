require 'rails_helper'

RSpec.feature "User Can Modify Link Read Status", type: :feature do
  scenario "change unread to read" do
    user = User.create(email: "matt@example.com", password: "password", password_confirmation: "password")

    visit login_path

    fill_in "Email", with: "matt@example.com"
    fill_in "Password", with: "password"
    fill_in "Password Confirmation", with: "password"
    click_on "Submit"

    expect(current_path).to eq(user_links_path(user))

    fill_in "Title", with: "Google"
    fill_in "URL", with: "https://www.google.com"
    click_on "Submit"

    expect(page).to have_content("Google")
    expect(page).to have_content("https://www.google.com")
    expect(user.links.first.read).to eq(false)
    expect(page).to have_content("Unread")
    expect(page).to have_content("Mark as Read")
  end
end
