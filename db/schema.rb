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

ActiveRecord::Schema.define(:version => 20120523200750) do

  create_table "landlords", :force => true do |t|
    t.string   "first"
    t.string   "last"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "properties", :force => true do |t|
    t.string   "address",                                                          :null => false
    t.text     "description"
    t.integer  "bedrooms"
    t.integer  "square_footage"
    t.boolean  "laundry",                                       :default => false
    t.decimal  "price",          :precision => 10, :scale => 0
    t.string   "unit"
    t.datetime "created_at",                                                       :null => false
    t.datetime "updated_at",                                                       :null => false
  end

end
