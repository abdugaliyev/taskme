class CreateResponces < ActiveRecord::Migration
  def change
    create_table :responces do |t|
      t.integer :task_id
      t.string :comment
      t.integer :price
      t.integer :user_id

      t.timestamps
    end
    add_index :responces, :user_id
  end
end
