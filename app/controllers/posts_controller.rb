class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.includes(:user).where(user: params[:user_id])
  end

  def show
    @post = Post.includes(:user, comments: [:user]).find(params[:id])
  end
end
