class PostsController < ApplicationController
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path
      flash[:success] = "Post created!"
    else
      flash.now[:danger] = "Post not created!"
      render 'new'
    end
  end

    def new
      @post = Post.new
    end
  

  private
    def post_params
      parmas.require(:post).permit(:content)
    end
end
