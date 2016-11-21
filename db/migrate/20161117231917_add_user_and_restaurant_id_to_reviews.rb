class AddUserAndRestaurantIdToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :user_id, :int
    add_column :reviews, :restaurant_id, :int
  end
end
