require 'rails_helper'

RSpec.feature "User Can Logout", type: :feature do
  scenario "from links index" do
    user = User.create(email: "matt@example.com", password: "password", password_confirmation: "password")

    visit login_path

    fill_in "Email", with: "matt@example.com"
    fill_in "Password", with: "password"
    click_on "Submit"

    expect(current_path).to eq(user_links_path(user))
    expect(page).to have_content('Logout')

    click_on "Logout"

    expect(current_path).to eq(root_path)
  end
end
