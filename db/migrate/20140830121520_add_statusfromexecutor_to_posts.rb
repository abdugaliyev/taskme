class AddStatusfromexecutorToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :statusfromexecutor, :integer, :default => 5
  end
end
