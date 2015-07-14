class AddForUserToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :for_user_id, :integer
    add_index :reviews, :for_user_id
  end
end
