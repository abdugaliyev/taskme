class RemoveTaskIdFromResponces < ActiveRecord::Migration
  def change
    remove_column :responces, :task_id, :integer
  end
end
