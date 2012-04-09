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

ActiveRecord::Schema.define(:version => 20120321195217) do

  create_table "sensor_data", :force => true do |t|
    t.integer  "sensor_id"
    t.float    "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sensor_hosts", :force => true do |t|
    t.string   "ip_address"
    t.string   "mac_address"
    t.string   "authorization_key"
    t.string   "location"
    t.datetime "last_online"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sensor_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sensors", :force => true do |t|
    t.integer  "sensor_host_id"
    t.integer  "sensor_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password", :limit => 128
    t.string   "salt",               :limit => 128
    t.string   "confirmation_token", :limit => 128
    t.string   "remember_token",     :limit => 128
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
