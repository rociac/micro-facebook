require 'rails_helper'

RSpec.describe 'user signup', type: :feature do
  scenario 'signs up the user correctly' do
    visit new_user_registration_path
    fill_in('Name', with: 'User1')
    fill_in('Email', with: 'example@email.com')
    fill_in('Password', with: 'user1password')
    fill_in('Password confirmation', with: 'user1password')
    click_button('Sign up')
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
end