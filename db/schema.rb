# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20131023201617) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buses", force: true do |t|
    t.string   "bus_line"
    t.string   "bus_title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "buses_routes", force: true do |t|
    t.integer  "bus_id"
    t.integer  "route_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "buses_routes", ["bus_id", "route_id"], name: "index_buses_routes_on_bus_id_and_route_id", unique: true, using: :btree

  create_table "buses_stops", force: true do |t|
    t.integer  "bus_id"
    t.integer  "stop_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "buses_stops", ["bus_id", "stop_id"], name: "index_buses_stops_on_bus_id_and_stop_id", unique: true, using: :btree

  create_table "routes", force: true do |t|
    t.string   "direction_tag"
    t.string   "direction_title"
    t.boolean  "inbound",         default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "routes_stops", force: true do |t|
    t.integer  "route_id"
    t.integer  "stop_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "routes_stops", ["route_id", "stop_id"], name: "index_routes_stops_on_route_id_and_stop_id", unique: true, using: :btree

  create_table "stops", force: true do |t|
    t.string   "stop_id"
    t.string   "stop_title"
    t.string   "lat"
    t.string   "long"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
