class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(content: comment_params[:content], user: current_user)
    if @comment.save
      flash[:success] = 'Comment created successfully!'
      redirect_to posts_path
    else
      flash[:danger] = 'Can\'t create comment!'
      redirect_to posts_path
    end
  end


  private
    def comment_params
      params.require(:comment).permit(:content)
    end

end
