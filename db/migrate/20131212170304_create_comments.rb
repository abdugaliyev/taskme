class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.string :name
    	t.integer :parent_id, :lft, :rgt
        t.text :body
        t.references :user, index: true

        t.integer :attachable_id
        t.string :attachable_type
      t.timestamps
    end
    
    add_index :comments, [:attachable_id, :attachable_type]
  end
end