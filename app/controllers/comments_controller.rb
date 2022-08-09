class CommentsController < ApplicationController
  before_action :set_comment, only: %i[index show update destroy]

  def index
    @comments = Comment.all
  end

  def edit; end

  def show; end

  def new
    @comment = Comment.new
  end

  def create
    user = User.find(params[:user_id])
    post = Post.find(params[:post_id])

    # current_user is gotten from ApplicationController
    created_comment = Comment.new(comment_params)
    created_comment.authorId = user.id
    created_comment.postId = post.id
    if created_comment.save
      redirect_to user_post_url(user, post)
    else
      render :new
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:text)
  end
end
