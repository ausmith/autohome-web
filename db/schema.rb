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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130407212338) do

  create_table "data_types", :force => true do |t|
    t.string   "longhand_unit",  :null => false
    t.string   "shorthand_unit", :null => false
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "nodes", :force => true do |t|
    t.string   "mac_address",                           :null => false
    t.string   "ip_address"
    t.integer  "status",                                :null => false
    t.boolean  "take_offline",       :default => false
    t.datetime "last_online"
    t.integer  "room_id"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "initialization_key"
    t.string   "one_time_key"
  end

  create_table "nodes_rooms", :force => true do |t|
    t.integer "room_id", :null => false
    t.integer "node_id", :null => false
  end

  create_table "rooms", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sensor_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "data_type_id"
    t.integer  "pins_used"
    t.string   "library_file"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "sensors", :force => true do |t|
    t.string   "name",           :null => false
    t.integer  "node_id",        :null => false
    t.integer  "sensor_type_id", :null => false
    t.integer  "starting_pin",   :null => false
    t.string   "pin_type",       :null => false
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "admin",                  :default => false
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
