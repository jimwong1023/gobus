class RoutesStops < ActiveRecord::Migration
  def change
    create_table :routes_stops do |t|
      t.belongs_to :route
      t.belongs_to :stop

      t.timestamps
    end
    add_index :routes_stops, [ :route_id, :stop_id ], unique: true
  end
end
