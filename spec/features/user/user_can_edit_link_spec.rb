require 'rails_helper'

RSpec.feature "User Can Edit Links", type: :feature do
  scenario "with valid information", type: :feature, js: true do
    create_user_and_sign_in

    fill_in "Title", with: "Google"
    fill_in "URL", with: "https://www.google.com"
    click_on "Submit"

    expect(page).to have_content("Google")
    expect(page).to have_content("https://www.google.com")
    expect(page).to have_content("Edit Link")

    link = Link.last

    click_on "Edit Link"

    fill_in "Title", with: "Yahoo"
    fill_in "URL", with: "https://www.yahoo.com"
    click_on "Submit"

    expect(page).to have_content("Yahoo")
    expect(page).to have_content("https://www.yahoo.com")
    expect(page).to_not have_content("Google")
    expect(page).to_not have_content("https://www.google.com")
  end

  scenario "with invalid information" do
    create_user_and_sign_in

    fill_in "Title", with: "Google"
    fill_in "URL", with: "https://www.google.com"
    click_on "Submit"

    expect(page).to have_content("Google")
    expect(page).to have_content("https://www.google.com")
    expect(page).to have_content("Edit Link")

    link = Link.last

    click_on "Edit Link"

    fill_in "Title", with: "Yahoo"
    fill_in "URL", with: "www.yahoo.com"
    click_on "Submit"

    expect(page).to have_content("Invalid URL.")
  end
end
