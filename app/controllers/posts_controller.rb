class PostsController < ApplicationController
  load_and_authorize_resource

  # GET /posts
  def index
    @user = User.find(params[:user_id])
    @posts = Post.includes(:user).where(user: @user.id)
    render json: @posts, status: :ok
    # respond_to do |format|
    #   format.html
    #   format.json { render json: @posts }
    # end
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
    created_post = Post.new(post_params)
    created_post.commentscounter = 0
    created_post.likescounter = 0
    created_post.authorId = user.id


    if created_post.save
      flash[:notice] = 'Post created successfully.'
      redirect_to user_post_url(user, created_post)
    else
      flash[:error] = 'Post unsucessful!'
      @post = created_post
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(@post.user), notice: "Successfully deleted #{@post.title}."
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
