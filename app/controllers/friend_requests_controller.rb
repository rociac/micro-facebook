# frozen_string_literal: true

class FriendRequestsController < ApplicationController
  before_action :set_friend_request, except: %i[index create]

  def create
    @friend = User.find(params[:friend_id])
    @friend_request = current_user.friend_requests.new(friend: @friend, confirmed: false)
    if @friend_request.save
      flash[:success] = 'Friend request sent!'
    else
      flash[:danger] = 'Can\'t send request, request already sent!'
    end
    redirect_to users_path
  end

  def index
    @incoming = FriendRequest.where(friend: current_user)
    @outgoing = current_user.friend_requests
  end

  def destroy
    if @friend_request.destroy
      flash[:success] = 'Canceled friend request!'
      redirect_to friend_requests_path
    else
      flash.now[:danger] = 'Could not cancel friend request!'
      render 'index'
    end
  end

  def update
    if @friend_request.accept
      flash[:success] = "You accepted #{@friend_request.user.name}!"
      redirect_to friend_requests_path
    else
      flash.now[:danger] = 'Could not accept friend!'
      render 'index'
    end
  end

  private

  def set_friend_request
    @friend_request = FriendRequest.find(params[:id])
  end
end
