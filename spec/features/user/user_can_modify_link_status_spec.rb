require 'rails_helper'

RSpec.feature "User Can Modify Link Read Status", type: :feature do
  scenario "change unread to read", type: :feature, js: true do
    create_user_and_sign_in

    fill_in "Title", with: "Turing"
    fill_in "URL", with: "https://www.turing.io"
    click_on "Submit"

    expect(page).to have_content("Turing")
    expect(page).to have_content("https://www.turing.io")
    expect(page).to have_content("Mark as Read")

    click_on "Mark as Read"

    expect(page).to have_content("read")

    click_on "Mark as unread"

    expect(page).to have_content("unread")
    expect(page).to have_content("Mark as read")
  end
end
