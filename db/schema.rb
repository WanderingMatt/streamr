# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090802024353) do

  create_table "feeds", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "type"
    t.boolean  "active",     :default => true
    t.boolean  "in_stream",  :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", :force => true do |t|
    t.integer  "feed_id"
    t.text     "source"
    t.string   "salt"
    t.boolean  "published",  :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
