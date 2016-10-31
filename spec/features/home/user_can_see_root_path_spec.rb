require 'rails_helper'

RSpec.feature 'User can see root path' do
  scenario 'guest user' do
    visit '/'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Log In or Sign Up')
  end
end
