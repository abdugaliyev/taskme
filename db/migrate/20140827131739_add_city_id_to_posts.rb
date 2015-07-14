class AddCityIdToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :city, index: true
  end
end
