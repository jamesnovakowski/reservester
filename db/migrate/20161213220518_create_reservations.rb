class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.datetime :start_res
      t.datetime :end_res
      t.integer :duration_min
      t.integer :user_id
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
