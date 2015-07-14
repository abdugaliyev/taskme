class AddHourpriceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :hourprice, :decimal
  end
end
