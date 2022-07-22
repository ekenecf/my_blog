class Like < ApplicationRecord
  belongs_to :post, class_name: 'Post', foreign_key: 'postId', counter_cache: 'likescounter'
  belongs_to :user, class_name: 'User', foreign_key: 'authorId'

  private

  def update_like_counter
    post.update(counter_cache: posts.likes.size)
  end
end
