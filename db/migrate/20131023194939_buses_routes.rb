class BusesRoutes < ActiveRecord::Migration
  def change
    create_table :buses_routes do |t|
      t.belongs_to :bus
      t.belongs_to :route

      t.timestamps
    end
    add_index :buses_routes, [ :bus_id, :route_id ], unique: true
  end
end
