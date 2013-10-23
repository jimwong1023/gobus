class Routes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :direction_tag, null: false
      t.string :direction_title, null: false
      t.boolean :inbound, default: true
    end
  end
end
