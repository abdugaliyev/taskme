class AddServiceandPricesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :serviceprice, :text
  end
end
