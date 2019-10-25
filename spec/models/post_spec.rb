# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  before :each do
    @user = User.create(name: 'User1', email: 'user1@example.com', password: 'user1password')
    @post = @user.posts.new(content: 'First post content')
  end

  context 'Valid post' do
    it 'should be valid' do
      expect(@post).to be_valid
    end
  end

  context 'Invalid post' do
    it 'should be an invalid post' do
      @post.content = ''
      expect(@post).to_not be_valid
    end
  end
end
