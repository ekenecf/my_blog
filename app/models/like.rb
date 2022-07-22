class Like < ApplicationRecord
    belongs_to :posts, count_comment: comments_counter
    belongs_to :users

end