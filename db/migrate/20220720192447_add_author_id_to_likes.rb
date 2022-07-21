class AddAuthorIdToLikes < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :authorId, :string
    add_index :likes, :authorId
  end
end
