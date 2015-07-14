class AddCountToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :count, :integer, :default => 0
  end
end
