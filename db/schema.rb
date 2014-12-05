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

ActiveRecord::Schema.define(:version => 20141127092940) do

  create_table "books", :force => true do |t|
    t.string   "book_name"
    t.integer  "location_id"
    t.string   "author"
    t.integer  "genre_id"
    t.integer  "shop_id"
    t.integer  "publisher_id"
    t.integer  "price"
    t.integer  "jan"
    t.date     "final_purchase"
    t.date     "final_sale"
    t.date     "publish_date"
    t.integer  "sale_number"
    t.integer  "inventory_number"
    t.integer  "nation_sale"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "books", ["genre_id"], :name => "index_books_on_genre_id"
  add_index "books", ["location_id"], :name => "index_books_on_location_id"
  add_index "books", ["publisher_id"], :name => "index_books_on_publisher_id"
  add_index "books", ["shop_id"], :name => "index_books_on_shop_id"

  create_table "genres", :force => true do |t|
    t.string   "genre_name"
    t.integer  "shop_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "genres", ["shop_id"], :name => "index_genres_on_shop_id"

  create_table "links", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "locations", :force => true do |t|
    t.string   "location_name"
    t.integer  "shop_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "locations", ["shop_id"], :name => "index_locations_on_shop_id"

  create_table "publishers", :force => true do |t|
    t.string   "publisher_name"
    t.integer  "shop_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "publishers", ["shop_id"], :name => "index_publishers_on_shop_id"

  create_table "shops", :force => true do |t|
    t.integer  "shop_no",    :null => false
    t.string   "shop_name",  :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "user_id"
    t.string   "password"
    t.string   "name"
    t.string   "uid"
    t.integer  "shop_no"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
