class AddReferencesToVerifications < ActiveRecord::Migration
  def change
    add_reference :verifications, :user, index: true
  end
end
