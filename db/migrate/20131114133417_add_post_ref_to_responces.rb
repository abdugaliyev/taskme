class AddPostRefToResponces < ActiveRecord::Migration
  def change
    add_reference :responces, :post, index: true
  end
end
