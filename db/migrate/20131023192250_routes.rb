class Routes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :direction_tag, unique: true
      t.string :direction_title, unique: true
      t.boolean :inbound, default: true
      t.belongs_to :bus

      t.timestamps
    end
  end
end
