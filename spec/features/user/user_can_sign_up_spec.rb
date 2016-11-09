require 'rails_helper'

RSpec.feature "User Can Login or Sign Up", type: :feature do
  scenario "guest user sign up", type: :feature, js: true do
    email = rand(10000)

    visit root_path

    click_on "Sign Up"

    expect(current_path).to eq(new_user_path)

    fill_in "Email", with: "Matt#{email}@example.com"
    fill_in "Password", with: "password"
    fill_in "Password Confirmation", with: "password"
    click_on "Submit"

    current_user = User.last.id

    expect(page).to have_content('Logout')
  end

  scenario "guest user sign up with invalid information" do
    email = rand(10000)
    visit root_path
    click_on "Sign Up"

    expect(current_path).to eq(new_user_path)

    fill_in "Password", with: "password"
    fill_in "Password Confirmation", with: "password"
    click_on "Submit"

    expect(page).to have_content("Email can't be blank")
    expect(page).to_not have_content('Logout')

    fill_in "Email", with: "Matt#{email}@example.com"
    fill_in "Password", with: "password"
    fill_in "Password Confirmation", with: "1password"
    click_on "Submit"

    expect(page).to have_content("Password confirmation doesn't match Password Log In Sign Up")
    expect(page).to_not have_content('Logout')
  end

  scenario "existing user sign in" do
    email = rand(10000)
    user = User.create(email: "matt#{email}@example.com", password: "password", password_confirmation: "password")

    visit login_path

    fill_in "Email", with: "matt@example.com"
    fill_in "Password", with: "password"
    click_on "Submit"

    expect(page).to have_content('Logout')
  end

  scenario "existing user sign in with invalid information" do
    user = User.create(email: "matt@example.com", password: "password", password_confirmation: "password")

    visit login_path

    fill_in "Password", with: "password"
    click_on "Submit"

    expect(page).to have_content("Invalid login")
    expect(page).to_not have_content('Logout')
  end
end
