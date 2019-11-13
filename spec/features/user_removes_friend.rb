# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user accepts a friend request', type: :feature do
  before :each do
    @user = User.create(name: 'user1', password: 'user1password',
                        password_confirmation: 'user1password',
                        email: 'user1@gmail.com')
    @friend = User.create(name: 'user2', password: 'user2password',
                          password_confirmation: 'user2password',
                          email: 'user2@gmail.com')
    visit new_user_session_path
    fill_in('user[email]', with: @user.email)
    fill_in('user[password]', with: @user.password)
    click_button('Log in')
    visit users_path
    click_link('Find Friends')
    expect(page).to have_content('People:')
    expect(page).to have_content('Add Friend')
    click_link('Add Friend')
    expect(page).to have_content('Friend request sent!')
    click_on('Log Out')
  end

  scenario 'Remove friend' do
    fill_in('user[email]', with: @friend.email)
    fill_in('user[password]', with: @friend.password)
    click_button('Log in')
    visit friend_requests_path
    click_on('Accept')
    expect(page).to have_content("You accepted #{@user.name}")
    visit friends_path
    expect(page).to have_content('Remove friend')
    click_on('Remove friend')
    expect(page).to have_content('Removed friend!')
  end
end
