class CreateUsersCategories < ActiveRecord::Migration
  def change
    create_table :users_categories do |t|
      t.references :user, index: true
      t.references :category, index: true

      t.timestamps
    end
  end
end
