class AddAuthorIdToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :authorId, :bigint
    add_index :posts, :authorId
  end
end
