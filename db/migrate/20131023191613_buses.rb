class Buses < ActiveRecord::Migration
  def change
    create_table :buses do |t|
      t.string :bus_line, unique: true
      t.string :bus_title, unique: true

      t.timestamps
    end
  end
end
