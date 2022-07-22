class User < ApplicationRecord
    has_many :posts, foreign_key: 'authorId', dependent: :destroy
    has_many :likes, foreign_key: 'authorId', dependent: :destroy
    has_many :comments, foreign_key: 'authorId', dependent: :destroy

end
