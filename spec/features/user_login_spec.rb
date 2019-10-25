# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User login', type: :feature do
  before :each do
    @user = User.create(name: 'User1', email: 'user1@example.com',
                        password: 'user1password', password_confirmation: 'user1password')
    visit new_user_session_path
    fill_in('Email', with: 'user1@example.com')
    fill_in('Password', with: 'user1password')
    click_button('Log in')
  end

  scenario 'User logs in successfully' do
    expect(page).to have_content('Signed in successfully.')
  end

  scenario 'User logs out successfully' do
    visit root_path
    click_on('Sign Out')
    expect(page).to have_content('Signed out successfully.')
  end
end
