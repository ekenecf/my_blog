class AddPostIdToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :postId, :bigint
    add_index :comments, :postId
  end
end
