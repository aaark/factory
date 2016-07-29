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

ActiveRecord::Schema.define(version: 20160729133409) do

  create_table "engines", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "fuel"
    t.integer  "power_rating"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "admin"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users_vehicles", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "user_id"
    t.integer  "vehicle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicle_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.integer  "wt_oc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "vehicle_type_id"
    t.integer "engine_id"
    t.string  "color"
    t.date    "st_date"
    t.date    "del_date"
    t.index ["engine_id"], name: "index_vehicles_on_engine_id", using: :btree
    t.index ["vehicle_type_id"], name: "index_vehicles_on_vehicle_type_id", using: :btree
  end

end