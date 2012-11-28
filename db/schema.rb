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

ActiveRecord::Schema.define(:version => 20121128113957) do

  create_table "edges", :force => true do |t|
    t.string   "source_id"
    t.string   "target_id"
    t.integer  "network_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "movie_relations", :force => true do |t|
    t.string   "movie_id"
    t.string   "related_movie_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "movie_relations", ["movie_id", "related_movie_id"], :name => "index_movie_relations_on_movie_id_and_related_movie_id"

  create_table "movies", :id => false, :force => true do |t|
    t.string   "movie_id"
    t.string   "title"
    t.string   "image_url"
    t.integer  "rating"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "completed"
    t.text     "related"
  end

  add_index "movies", ["movie_id"], :name => "index_movies_on_movie_id", :unique => true

  create_table "networks", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
