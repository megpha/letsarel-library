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

ActiveRecord::Schema.define(:version => 20120716185556) do

  create_table "authors", :force => true do |t|
    t.string   "first_name", :null => false
    t.string   "last_name",  :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "books", :force => true do |t|
    t.string   "title",                           :null => false
    t.string   "language",                        :null => false
    t.string   "genre",                           :null => false
    t.integer  "publisher_id",                    :null => false
    t.boolean  "published",    :default => false, :null => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "books", ["publisher_id"], :name => "index_books_on_publisher_id"

  create_table "collaborations", :force => true do |t|
    t.integer  "book_id",    :null => false
    t.integer  "author_id",  :null => false
    t.string   "role",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "collaborations", ["author_id"], :name => "index_collaborations_on_author_id"
  add_index "collaborations", ["book_id"], :name => "index_collaborations_on_book_id"

  create_table "publishers", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
