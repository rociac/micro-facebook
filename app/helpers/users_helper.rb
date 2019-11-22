# frozen_string_literal: true

module UsersHelper
  def gravatar_for(user, _options = { size: 80})
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar _avatar")
  end

  def display_users(user)
    if user != current_user 
      check_friendship(user)
    end
  end

  def check_friendship(user)
    gravatar = gravatar_for user
    user_link = link_to(user.name, user_path(user.id), class: 'ml-2')
    icon = content_tag(:i, '', class: 'fas fa-check ml-2')
    request_sent = content_tag(:h4, gravatar + user_link + link_to('Request Sent!', friend_requests_path, class: 'ml-4 pl-4 btn btn-success'), class: 'mt-4 bg-dark p-3 mb-2')

    if current_user.friends.include?(user)
      content_tag(:h4, gravatar + user_link + content_tag(:small, 'You\'re already Friends!', class: 'ml-4 pl-4 text-secondary') + icon , class: 'mt-4 bg-dark p-3 mb-2')
    else
      if user.pending_friends.include?(current_user)
        request_sent
      elsif !FriendRequest.exists?(user: current_user, friend: user)
                content_tag(:h4, gravatar + user_link +         link_to('Add friend', friend_requests_path(:friend_id => user), :method => :post, class: 'ml-big pl-4 btn btn-primary'), class: 'mt-4 bg-dark p-3 mb-2')
      else
        request_sent
      end      
    end
  end

end
