class AddNegativecolumnToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :negative, :integer, default: 0
  end
end
