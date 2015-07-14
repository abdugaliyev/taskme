class AddFinalPriceToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :customer_price, :decimal
    add_column :reviews, :executor_price, :decimal
    add_column :reviews, :status, :decimal
  end
end
