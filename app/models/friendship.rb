# frozen_string_literal: true

class Friendship < ApplicationRecord
  after_create :create_inverse_relationship
  after_destroy :destroy_inverse_relationship

  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validate :not_self
  validates :user, presence: true
  validates :friend, presence: true, uniqueness: { scope: :user }
  validate :can_be_friends?, on: :create

  private

  def create_inverse_relationship
    friend.friendships.create(friend: user)
  end

  def destroy_inverse_relationship
    friendship = friend.friendships.find_by(friend: user)
    friendship.destroy if friendship
  end

  def not_self
    errors.add(:friend, "can't be equal to user") if user == friend
  end

  def can_be_friends?
    @friend_request = FriendRequest.find_by(user: user, friend: friend)
    if @friend_request.confirmed 
      errors.add(:friend, "Cant be your friend")
    end
    @friend_request = FriendRequest.find_by(user: user, friend: friend)
  end

end
