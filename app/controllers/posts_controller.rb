class PostsController < ApplicationController
  # GET /posts
  def index
    @user = User.find(params[:user_id])
    @posts = Post.includes(:user).where(user: @user.id)
  end

  # GET /new
  def new
    @post = Post.new
  end

  # GET /posts/:id
  def show
    @user = User.find(params[:user_id])
    @post = Post.includes(:user, :comments).find(params[:id])
  end

  # POST /posts
  def create
    user = User.find(params[:user_id])
    # current_user is gotten from ApplicationController
    created_post = current_user.posts.new(post_params)
    created_post.commentscounter = 0
    created_post.likescounter = 0
    created_post.authorId = user.id

    if created_post.save
      flash[:notice] = 'Post correctly created!!'
      redirect_to user_posts_url(user, created_post)
    else
      flash.now[:error] = 'Error: Post could not be saved'
      @post = created_post
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
