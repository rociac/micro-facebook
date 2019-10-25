require 'rails_helper'
RSpec.describe 'User creates Post', type: :feature do
    before :each do
        @user = User.create(name: 'User1', email: 'user1@example.com', password: 'user1password', password_confirmation: 'user1password')
        visit new_user_session_path
        fill_in('Email', with: 'user1@example.com')
        fill_in('Password', with: 'user1password')
        click_button('Log in')
    end

    scenario 'user creates post' do
        visit new_post_path 
        expect(page).to have_current_path(new_post_path)
        fill_in('post[content]', with: 'new post for user1')
        click_button('Post')
        expect(page).to have_current_path(posts_path)
    end

  
end