class Stops < ActiveRecord::Migration
  def change
    create_table :stops do |t|
      t.string :stop_id, null: false
      t.string :stop_title, null: false
      t.string :lat, null: false
      t.string :long, null: false

      t.timestamps
    end
  end
end
