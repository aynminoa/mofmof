class CreateNearestStations < ActiveRecord::Migration[6.0]
  def change
    create_table :nearest_stations do |t|
      t.string :line
      t.string :station
      t.integer :on_foot
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
