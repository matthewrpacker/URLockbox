require 'rails_helper'

RSpec.feature "User Can See Initial Links Content", type: :feature do
  scenario "before submitting a link", type: :feature, js: true do
    create_user_and_sign_in

    within("body") do
      expect(page).to have_link("Logout")
    end

    within("h1") do
      expect(page).to have_content("Enter New Link")
    end

    within("form") do
      expect(page).to have_selector("input[placeholder='Title']")
      expect(page).to have_selector("input[placeholder='URL']")
      expect(page).to have_button("Submit")
    end

    within("h2") do
      expect(page).to have_content("All Links")
    end

    within(".center-table") do
      expect(page).to have_selector("input[placeholder='Search by title or url']")
      expect(page).to have_button("Sort Alphabetically")
      expect(page).to have_button("Filter Read")
      expect(page).to have_button("Filter Unread")
    end

    within("thead tr") do
      expect(page).to have_content("Title")
      expect(page).to have_content("URL")
      expect(page).to have_content("Status")
      expect(page).to have_content("Modify Status")
      expect(page).to have_content("Edit Link")
    end

    # within("form") do
    #   expect(page).to have_selector("input[placeholder='Title']")
    #   expect(page).to have_selector("input[placeholder='URL']")
    # end


    # within("tbody > tr:nth-child(2)") do
    #   expect(page).to have_content("unread")
    #   expect(page).to have_content("Turing")
    #   expect(page).to have_content("https://www.turing.io")
    # end
    #
    # click_on "Filter Read"
    #
    # expect(page).to have_content("Google")
    # expect(page).to have_content("https://www.google.com")
    # expect(page).to_not have_content("Turing")
    # expect(page).to_not have_content("https://www.turing.io")
    #
    # click_on "Filter Unread"
    #
    # expect(page).to have_content("Turing")
    # expect(page).to have_content("https://www.turing.io")
    # expect(page).to_not have_content("Google")
    # expect(page).to_not have_content("https://www.google.com")
  end
end
