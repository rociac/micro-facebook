# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(content: comment_params[:content], user: current_user)
    if @comment.save
      flash[:success] = 'Comment created successfully!'
    else
      flash[:danger] = 'Can\'t create comment!'
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
