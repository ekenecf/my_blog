class Comment < ApplicationRecord
    belongs_to :post, class_name: 'Post'
    belongs_to :user, class_name: 'User'

end
