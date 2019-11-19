# frozen_string_literal: true

class FriendsController < ApplicationController
  before_action :set_friend, only: :destroy
  
  def index
    @friends = current_user.friends
  end

  def destroy
    current_user.remove_friend(@friend)
    flash[:success] = 'Removed friend!'
    redirect_to root_path
  end

  private

  def set_friend
    @friend = current_user.friends.find(params[:id])
  end
end
