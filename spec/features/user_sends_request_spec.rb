# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user sends friend request', type: :feature do
  before :each do
    @user = User.create(name: 'User1', email: 'user1@example.com',
                        password: 'user1password', password_confirmation: 'user1password')
    @friend = User.create(name: 'User2', email: 'user2@example.com',
                          password: 'user2password', password_confirmation: 'user2password')
    visit new_user_session_path
    fill_in('Email', with: 'user1@example.com')
    fill_in('Password', with: 'user1password')
    click_button('Log in')
  end

  scenario 'user adds friends' do
    visit root_path
    click_link('Find Friends')
    expect(page).to have_content('People:')
    expect(page).to have_content('Add Friend')
    click_link('Add Friend')
    expect(page).to have_content('Friend request sent!')
  end

  scenario 'user adds friends' do
  end
end
