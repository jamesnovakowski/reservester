class AddCommenttoReservations < ActiveRecord::Migration[5.0]
  def change
  	add_column :reservations, :comment, :string
  end
end
