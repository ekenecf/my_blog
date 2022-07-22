class AddAuthorIdToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :authorId, :bigint
    add_index :comments, :authorId
  end
end
