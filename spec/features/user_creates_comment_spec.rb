# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'User creates Post', type: :feature do
  before :each do
    @user = User.create(name: 'User1', email: 'user1@example.com',
                        password: 'user1password', password_confirmation: 'user1password')
    visit new_user_session_path
    fill_in('Email', with: 'user1@example.com')
    fill_in('Password', with: 'user1password')
    click_button('Log in')
    @post = @user.posts.create!(content: 'New post')
    visit post_path(@post)
  end

  scenario 'user creates comment' do
    fill_in('comment[content]', with: 'New comment')
    click_button('Comment')
    expect(page).to have_content('Comment created successfully!')
  end

  scenario 'user fails to create comment' do
    fill_in('comment[content]', with: '')
    click_button('Comment')
    expect(page).to have_content('Can\'t create comment!')
  end
end
