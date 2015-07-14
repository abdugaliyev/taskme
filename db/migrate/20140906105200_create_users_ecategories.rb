class CreateUsersEcategories < ActiveRecord::Migration
  def change
    create_table :users_ecategories do |t|
      t.references :user, index: true
      t.references :ecategory, index: true

      t.timestamps
    end
  end
end
