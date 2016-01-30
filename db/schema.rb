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

ActiveRecord::Schema.define(version: 20160129170925) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accessories", force: :cascade do |t|
    t.string   "name"
    t.string   "element"
    t.string   "style"
    t.string   "color"
    t.string   "occasion"
    t.string   "season"
    t.boolean  "worn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "accessories", ["user_id"], name: "index_accessories_on_user_id", using: :btree

  create_table "garments", force: :cascade do |t|
    t.string   "name"
    t.string   "element"
    t.string   "style"
    t.string   "color"
    t.string   "occasion"
    t.string   "season"
    t.boolean  "worn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "garments", ["user_id"], name: "index_garments_on_user_id", using: :btree

  create_table "outfits", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "outfits", ["user_id"], name: "index_outfits_on_user_id", using: :btree

  create_table "shoes", force: :cascade do |t|
    t.string   "name"
    t.string   "element"
    t.string   "style"
    t.string   "color"
    t.string   "occasion"
    t.string   "season"
    t.boolean  "worn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "shoes", ["user_id"], name: "index_shoes_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "accessories", "users"
  add_foreign_key "garments", "users"
  add_foreign_key "outfits", "users"
  add_foreign_key "shoes", "users"
end
