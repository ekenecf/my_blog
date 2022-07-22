class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'authorId', counter_cache: 'postcounter'
  has_many :comments, foreign_key: 'postId', dependent: :destroy
  has_many :likes, foreign_key: 'postId', dependent: :destroy

  def update_post_counter
    user.update(counter_cache: user.posts.size)
  end

  def most_recent_comments
    comments.order('created_at DESC').limit(5)
  end
end
