# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(name: 'user1', email: 'user1@example.com', password: 'user1password')
  end

  context 'Valid user' do
    it 'should have a valid name' do
      expect(@user).to be_valid
    end

    it 'should have a valid email' do
      expect(@user).to be_valid
    end
  end

  context 'Invalid user' do
    it 'has an invalid name' do
      @user.name = ''
      expect(@user).to_not be_valid
    end
  end
end
