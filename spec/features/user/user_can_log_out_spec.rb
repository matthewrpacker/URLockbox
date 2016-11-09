require 'rails_helper'

RSpec.feature "User Can Logout", type: :feature do
  scenario "from links index", type: :feature, js: true do
    create_user_and_sign_in

    expect(page).to have_content('Logout')

    click_on "Logout"

    expect(current_path).to eq(root_path)
  end
end
