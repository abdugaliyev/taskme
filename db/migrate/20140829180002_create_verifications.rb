class CreateVerifications < ActiveRecord::Migration
  def change
    create_table :verifications do |t|
      t.text :first_name
      t.text :last_name
      t.text :second_name
      t.date :birthday
      t.string :phone
      t.text :tpname
      t.text :tprelation
      t.string :tpphone
      t.text :tp1name
      t.text :tp1relation
      t.string :tp1phone
      t.boolean :firstverification
      t.boolean :verificationinformright
      t.boolean :kzcitizen

      t.timestamps
    end
  end
end
