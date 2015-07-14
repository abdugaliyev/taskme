class AddAdressesToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :adress1, :string
    add_column :posts, :adress2, :string
  end
end
