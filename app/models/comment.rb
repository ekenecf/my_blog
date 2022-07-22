class Comment < ApplicationRecord
  belongs_to :post, class_name: 'Post', foreign_key: 'postId', counter_cache: 'commentscounter'
  belongs_to :user, class_name: 'User', foreign_key: 'authorId'

  private

  def update_comment_counter
    post.update(counter_cache: post.comments.size)
  end
end
