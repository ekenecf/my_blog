class CommentsController < ApplicationController
  def index
    @post = Post.find(params[:user_id])
    @comments = Comment.all
  end

  def show; end

  def new
    @comment = Comment.new
  end

  def create
    comment = params[:comment]
    user = User.find(params[:user_id])
    post = Post.find(params[:post_id])
    puts user, post.comments_counter
    created_comment = Comment.new(comment.permit(:text))
    created_comment.author_id = user.id
    created_comment.post_id = post.id
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
