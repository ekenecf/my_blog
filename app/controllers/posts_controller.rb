class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.includes(:user).where(user: params[:user_id])
  end

  def show
    @post = Post.includes(:user, comments: [:user]).find(params[:id])
  end

  def new
    @posts = Post.new
    render :new
  end

  def create
    post = params[:post]
    user = User.find(params[:user_id])
    created_post = Post.new(post.permit(:title, :text))
    created_post.commentscounter = 0
    created_post.likescounter = 0
    created_post.authorId = user.id

    if created_post.save
      flash[:notice] = 'Post correctly created'
      redirect_to user_post_url(user, new_post)
    else
      flash.now[:error] = "Error: Post could not be saved"
      @post = created_post
      render :new
    end
  end
end
