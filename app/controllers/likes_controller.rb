class LikesController < ApplicationController
  def index
    @likes = Like.all
  end

  def new
    @like = Like.new
  end

  def show; end

  def create
    @post = Post.includes(:user).find(params[:post_id])
    @post_author = @post.user

    # current_user is gotten from ApplicationController

    @liked_posts_by_this_user = Like.where(user: @post_author, post: @post)

    destroy && return if @liked_posts_by_this_user.present?

    new_like = Like.create(user: @post_author, post: @post)

    return unless new_like.save

    flash[:notice] = 'You liked this post.'
    redirect_back_or_to user_post_url(@post_author, @post)
  end

  def destroy
    @liked_posts_by_this_user.destroy_all
    flash[:notice] = 'You unliked this post.'
    redirect_back_or_to user_post_url(@post_author, @post)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_like
    @like = Like.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def like_params
    params.fetch(:like, {})
  end
end
