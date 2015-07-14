class AddAuthorIdReadToActivities < ActiveRecord::Migration
  def change
    add_reference :activities, :author, index: true
    add_column :activities, :read, :boolean, default: false
  end
end
