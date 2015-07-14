class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.text :content
      t.date :date
      t.time :time
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
    add_index :posts, :user_id
    add_index :posts, :category_id
  end
end
