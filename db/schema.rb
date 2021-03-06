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

ActiveRecord::Schema.define(version: 20170120223400) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "observation_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "comments", ["observation_id"], name: "index_comments_on_observation_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "observation_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "likes", ["observation_id"], name: "index_likes_on_observation_id", using: :btree
  add_index "likes", ["user_id"], name: "index_likes_on_user_id", using: :btree

  create_table "observations", force: :cascade do |t|
    t.date     "date"
    t.string   "goal"
    t.string   "program"
    t.boolean  "prompt"
    t.string   "behavior"
    t.text     "session_notes"
    t.integer  "patient_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "observations", ["patient_id", "user_id"], name: "index_observations_on_patient_id_and_user_id", using: :btree
  add_index "observations", ["patient_id"], name: "index_observations_on_patient_id", using: :btree
  add_index "observations", ["user_id"], name: "index_observations_on_user_id", using: :btree

  create_table "patients", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "diagnosis"
    t.string   "parent"
    t.string   "parent_email"
    t.integer  "age"
    t.string   "gender"
    t.string   "home_session"
    t.string   "school_session"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "field"
    t.string   "role"
    t.string   "location"
    t.string   "sector"
    t.string   "email"
    t.string   "password_digest"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_foreign_key "comments", "observations"
  add_foreign_key "comments", "users"
  add_foreign_key "likes", "observations"
  add_foreign_key "likes", "users"
  add_foreign_key "observations", "patients"
  add_foreign_key "observations", "users"
end
