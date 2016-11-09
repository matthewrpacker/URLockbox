require 'rails_helper'

RSpec.feature "User Can Add Links", type: :feature do
  scenario "with valid information", type: :feature, js: true do
    create_user_and_sign_in

    fill_in "Title", with: "Google"
    fill_in "URL", with: "https://www.google.com"
    click_on "Submit"

    expect(page).to have_content("Google")
    expect(page).to have_content("https://www.google.com")
  end

  scenario "with invalid information" do
    create_user_and_sign_in

    fill_in "Title", with: "Yahoo"
    fill_in "URL", with: "www.yahoo.com"
    click_on "Submit"

    expect(page).to have_content("Invalid URL.")
    expect(page).to_not have_content("Yahoo")
    expect(page).to_not have_content("www.yahoo.com")
  end
end
