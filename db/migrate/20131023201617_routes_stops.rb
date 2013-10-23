class RoutesStops < ActiveRecord::Migration
  def change
    create_table :routes_stops do |t|
      t.belongs_to :route
      t.belongs_to :stop

      t.timestamps
    end
  end
end
