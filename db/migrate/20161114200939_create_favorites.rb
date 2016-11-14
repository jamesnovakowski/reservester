class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.boolean :star

      t.timestamps
    end
  end
end
