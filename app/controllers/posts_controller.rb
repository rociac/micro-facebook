# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'Post created!'
      redirect_to posts_path
    else
      flash.now[:danger] = 'Post not created!'
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = current_user.posts + Post.joins("INNER JOIN friendships ON
                                              posts.user_id=friendships.user_id AND friendships.friend_id=
                                              #{current_user.id}")
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
