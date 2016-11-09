require 'rails_helper'

RSpec.feature "User Can Search by anything in URL or Title Columns", type: :feature do
  scenario "enters text in search field", type: :feature, js: true do
    create_user_and_sign_in
    
    fill_in "Title", with: "Turing"
    fill_in "URL", with: "https://www.turing.io"
    click_on "Submit"

    fill_in "Title", with: "Google"
    fill_in "URL", with: "https://www.google.com"
    click_on "Submit"

    expect(page).to have_content("Turing")
    expect(page).to have_content("https://www.turing.io")
    expect(page).to have_content("Google")
    expect(page).to have_content("https://www.google.com")

    fill_in "Search by title or url", with: "tur"

    expect(page).to have_content("Turing")
    expect(page).to have_content("https://www.turing.io")
    expect(page).to_not have_content("Google")
    expect(page).to_not have_content("https://www.google.com")
  end
end
