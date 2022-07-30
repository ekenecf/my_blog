class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.includes(:user).where(user: params[:user_id])
  end

  def new
    @posts = Post.new
    render :new
  end

  def show
    @post = Post.includes(:user, comments: [:user]).find(params[:id])
  end

  def create
    print params
    user = User.find(params[:user_id])
    created_post = Post.new(params.require(:post).permit(:title, :text, :user_id))
    created_post.commentscounter = 0
    created_post.likescounter = 0
    created_post.authorId = params[:user_id]

    if created_post.save
      flash[:notice] = 'Post correctly created!!'
      redirect_to user_posts_url(user, created_post)
    else
      flash.now[:error] = "Error: Post could not be saved"
      @post = created_post
      render :new
    end
  end
end
