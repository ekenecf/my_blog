class User < ApplicationRecord
  has_many :posts, foreign_key: 'authorId', dependent: :destroy
  has_many :likes, foreign_key: 'authorId', dependent: :destroy
  has_many :comments, foreign_key: 'authorId', dependent: :destroy

  def most_recent_posts
    posts.order('created_at DESC').limit(3)
  end
end
