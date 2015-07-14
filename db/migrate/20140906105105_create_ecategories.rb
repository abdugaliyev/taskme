class CreateEcategories < ActiveRecord::Migration
  def change
    create_table :ecategories do |t|
      t.text :name
      t.integer :parent_id

      t.timestamps
    end
    add_index :ecategories, :parent_id
  end
end
