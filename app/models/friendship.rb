# frozen_string_literal: true

class Friendship < ApplicationRecord
  after_create :create_inverse_relationship
  after_destroy :destroy_inverse_relationship

  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validate :not_self
  validates :user, presence: true
  validates :friend, presence: true, uniqueness: { scope: :user }

  private

  def create_inverse_relationship
    friend.friendships.create(friend: user)
  end

  def destroy_inverse_relationship
    friendship = friend.friendships.find_by(friend: user)
    friendship&.destroy
  end

  def not_self
    errors.add(:friend, "can't be equal to user") if user == friend
  end
end
