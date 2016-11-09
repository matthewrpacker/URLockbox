require 'rails_helper'

RSpec.feature "User Can Sort Alphabetically", type: :feature do
  scenario "after clicking button", type: :feature, js: true do
    create_user_and_sign_in

    fill_in "Title", with: "Google"
    fill_in "URL", with: "https://www.google.com"
    click_on "Submit"

    fill_in "Title", with: "Turing"
    fill_in "URL", with: "https://www.turing.io"
    click_on "Submit"

    within("tbody > tr:nth-child(1)") do
      expect(page).to have_content("Turing")
      expect(page).to have_content("https://www.turing.io")
    end

    within("tbody > tr:nth-child(2)") do
      expect(page).to have_content("Google")
      expect(page).to have_content("https://www.google.com")
    end

    click_on "Sort Alphabetically"

    within("tbody > tr:nth-child(1)") do
      expect(page).to have_content("Google")
      expect(page).to have_content("https://www.google.com")
    end

    within("tbody > tr:nth-child(2)") do
      expect(page).to have_content("Turing")
      expect(page).to have_content("https://www.turing.io")
    end
  end
end
