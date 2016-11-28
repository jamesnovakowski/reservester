class RemoveImageFromRestaurants < ActiveRecord::Migration[5.0]
  def change
    remove_column :restaurants, :image, :string
  end
end
