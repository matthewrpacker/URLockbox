require 'rails_helper'

RSpec.feature "User Can Modify Link Read Status", type: :feature do
  scenario "change unread to read", type: :feature, js: true do
    email = rand(1000)

    visit root_path

    click_on "Sign Up"

    expect(current_path).to eq(new_user_path)

    fill_in "Email", with: "Matt#{email}@example.com"
    fill_in "Password", with: "password"
    fill_in "Password Confirmation", with: "password"
    click_on "Submit"

    current_user = User.last

    fill_in "Title", with: "Google"
    fill_in "URL", with: "https://www.google.com"
    click_on "Submit"

    current_user = User.last
    expect(page).to have_content("Google")
    expect(page).to have_content("https://www.google.com")
    expect(current_user.links.first.read).to eq(false)
    expect(page).to have_content("Mark as Read")

    click_on "Mark as Read"

    expect(page).to have_content("read")

    click_on "Mark as unread"

    expect(page).to have_content("unread")
    expect(page).to have_content("Mark as read")
  end
end
