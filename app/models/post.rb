class Post < ApplicationRecord
    belongs_to :user, class_name: 'User'
    has_many :comments, foreign_key: 'postId', dependent: :destroy
    has_many :likes, foreign_key: 'postId', dependent: :destroy
end
