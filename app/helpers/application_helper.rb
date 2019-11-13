# frozen_string_literal: true

module ApplicationHelper
  def incoming_requests(user)
    FriendRequest.where(friend: user)
  end

  def outgoing_requests(user)
    user.friend_requests
  end
end
