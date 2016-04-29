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

ActiveRecord::Schema.define(version: 20160429150356) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dummies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "travels", force: :cascade do |t|
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "subject"
    t.string   "todo"
    t.string   "place"
    t.string   "preposition", default: "in"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "nick"
    t.string   "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "admin"
  end

  create_table "videos", force: :cascade do |t|
    t.string   "title"
    t.string   "vid"
    t.string   "media_url"
    t.string   "cover_url"
    t.integer  "duration"
    t.integer  "user_id"
    t.integer  "travel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "videos", ["title"], name: "index_videos_on_title", using: :btree
  add_index "videos", ["travel_id"], name: "index_videos_on_travel_id", using: :btree
  add_index "videos", ["user_id"], name: "index_videos_on_user_id", using: :btree
  add_index "videos", ["vid"], name: "index_videos_on_vid", using: :btree

  add_foreign_key "videos", "travels"
  add_foreign_key "videos", "users"
end
