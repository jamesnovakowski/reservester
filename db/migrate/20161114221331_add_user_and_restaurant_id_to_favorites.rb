class AddUserAndRestaurantIdToFavorites < ActiveRecord::Migration[5.0]
  def change
  	add_column :favorites, :user_id, :int
  	add_column :favorites, :restaurant_id, :int
  end
end
