class AddPriceToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :price, :decimal
    add_column :categories, :second_name, :text
  end
end
