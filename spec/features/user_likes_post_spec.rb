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
    @post = @user.posts.create!(content: "New post")
    visit post_path(@post)
  end
    
  scenario 'user likes post' do
    find(:css, 'i.fas.fa-heart.icon').click
    expect(page).to have_content('1')
  end

  scenario 'same user likes post again' do
    find(:css, 'i.fas.fa-heart.icon').click
    expect(page).to have_content('1')
  end

end
