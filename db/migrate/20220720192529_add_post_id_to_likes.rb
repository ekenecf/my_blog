class AddPostIdToLikes < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :postId, :string
    add_index :likes, :postId
  end
end
