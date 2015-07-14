class AddFinalPricingToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :finalcustomerprice, :decimal
    add_column :posts, :finalexecutorprice, :decimal
  end
end
