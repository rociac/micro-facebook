class FriendRequest < ApplicationRecord
  belongs_to :user
  belongs_to :friend

  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validate :not_friends
  validate :not_pending
  validate :not_self
  validates :user, presence: true
  validates :friend, presence: true, uniqueness: { scope: :user }


  def accept
    user.friends << friend
    destroy
  end

  private

  def not_friends
    errors.add(:friend, 'is already added') if user.friends.include?(friend)
  end

  def not_pending
    errors.add(:friend, 'already requested friendship') if friend.pending_friends.include?(user)
  end

  def not_self
    errors.add(:friend, "can't be equal to user") if user == friend
  end
end
