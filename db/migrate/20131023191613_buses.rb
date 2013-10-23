class Buses < ActiveRecord::Migration
  def change
    create_table :buses do |t|
      t.string :bus_line, null: false
      t.string :bus_title, null: false

      t.timestamps
    end
  end
end
