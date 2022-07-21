class AddAuthorIdToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :authorId, :string
    add_index :comments, :authorId
  end
end
