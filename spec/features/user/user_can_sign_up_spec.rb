require 'rails_helper'

RSpec.feature "User Can Login", type: :feature do
  xscenario "from the root page" do
    visit root_path
    click_on "Log In or Sign Up"

    expect(current_path).to eq(new_user_path)

    fill_in "Email", with: "example@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password Confirmation", with: "password"
    click_on "Submit"

    expect(current_path).to eq(links_path)
  end
end
