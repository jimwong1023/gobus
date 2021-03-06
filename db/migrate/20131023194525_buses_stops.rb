class BusesStops < ActiveRecord::Migration
  def change
    create_table :buses_stops do |t|
      t.belongs_to :bus
      t.belongs_to :stop

      t.timestamps
    end
    
    add_index :buses_stops, [ :bus_id, :stop_id ], unique: true
  end
end
