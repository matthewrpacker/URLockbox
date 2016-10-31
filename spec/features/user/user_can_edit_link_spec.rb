require 'rails_helper'

RSpec.feature "User Can Edit Links", type: :feature do
  scenario "with valid information" do
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
    expect(page).to have_content("Edit Link")

    link = Link.last

    click_on "Edit Link"

    expect(current_path).to eq(edit_user_link_path(user, link))

    fill_in "Title", with: "Yahoo"
    fill_in "URL", with: "https://www.yahoo.com"
    click_on "Submit"

    expect(current_path).to eq(user_links_path(user))

    expect(page).to have_content("Yahoo")
    expect(page).to have_content("https://www.yahoo.com")
    expect(page).to_not have_content("Google")
    expect(page).to_not have_content("https://www.google.com")
  end

  scenario "with invalid information" do
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
    expect(page).to have_content("Edit Link")

    link = Link.last

    click_on "Edit Link"

    expect(current_path).to eq(edit_user_link_path(user, link))

    fill_in "Title", with: "Yahoo"
    fill_in "URL", with: "www.yahoo.com"
    click_on "Submit"

    expect(page).to have_content("Invalid URL.")
  end
end
