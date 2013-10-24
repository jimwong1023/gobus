class Stops < ActiveRecord::Migration
  def change
    create_table :stops do |t|
      t.string :stop_id, unique: true
      t.string :stop_title, unique: true
      t.string :lat
      t.string :long

      t.timestamps
    end
  end
end
