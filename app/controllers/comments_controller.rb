class CommentsController < ApplicationController
  before_action only: %i[create index show update destroy]

  load_and_authorize_resource

  def index
    @comments = Comment.all
    render json: @comments, status: :ok
  end

  def edit; end

  def show; end

  def new
    @comment = Comment.new
  end

  def create
    user = User.find(params[:user_id])
    post = Post.find(params[:post_id])

    created_comment = Comment.new(comment_params)
    created_comment.authorId = user.id
    created_comment.postId = post.id
    if created_comment.save
      redirect_to user_post_url(user, post)
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to user_posts_path(current_user, @comment.post), notice: 'Successfully deleted'
  end

  private

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:text)
  end
end
