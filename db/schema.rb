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

ActiveRecord::Schema.define(version: 20170107061216) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "folders", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "folders", ["parent_id"], name: "index_folders_on_parent_id", using: :btree
  add_index "folders", ["user_id"], name: "index_folders_on_user_id", using: :btree

  create_table "uploads", force: :cascade do |t|
    t.text     "upload_data"
    t.integer  "user_id"
    t.integer  "uploadable_id"
    t.string   "uploadable_type"
    t.integer  "folder_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "uploads", ["folder_id"], name: "index_uploads_on_folder_id", using: :btree
  add_index "uploads", ["uploadable_type", "uploadable_id"], name: "index_uploads_on_uploadable_type_and_uploadable_id", using: :btree
  add_index "uploads", ["user_id"], name: "index_uploads_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "name"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
