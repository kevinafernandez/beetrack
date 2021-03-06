class CreateWaypoints < ActiveRecord::Migration[5.2]
  def change
    create_table :waypoints do |t|
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6
      t.datetime :sent_at
      t.references :vehicle, null: false, foreign_key: true

      t.timestamps
    end
  end
end