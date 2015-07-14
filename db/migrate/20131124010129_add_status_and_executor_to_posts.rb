class AddStatusAndExecutorToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :status, :integer
    add_reference :posts, :executor, index: true
  end
end
