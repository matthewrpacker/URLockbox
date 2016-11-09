require 'rails_helper'

RSpec.feature "User Can Filter by Status", type: :feature do
  scenario "for unread or read", type: :feature, js: true do
    create_user_and_sign_in

    fill_in "Title", with: "Turing"
    fill_in "URL", with: "https://www.turing.io"
    click_on "Submit"

    fill_in "Title", with: "Google"
    fill_in "URL", with: "https://www.google.com"
    click_on "Submit"

    within("tbody > tr:nth-child(1)") do
      click_on "Mark as Read"
      expect(page).to have_content("read")
      expect(page).to have_content("Google")
      expect(page).to have_content("https://www.google.com")
    end

    within("tbody > tr:nth-child(2)") do
      expect(page).to have_content("unread")
      expect(page).to have_content("Turing")
      expect(page).to have_content("https://www.turing.io")
    end

    click_on "Filter Read"

    expect(page).to have_content("Google")
    expect(page).to have_content("https://www.google.com")
    expect(page).to_not have_content("Turing")
    expect(page).to_not have_content("https://www.turing.io")

    click_on "Filter Unread"

    expect(page).to have_content("Turing")
    expect(page).to have_content("https://www.turing.io")
    expect(page).to_not have_content("Google")
    expect(page).to_not have_content("https://www.google.com")
  end
end
