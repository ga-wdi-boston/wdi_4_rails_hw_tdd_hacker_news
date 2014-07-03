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

ActiveRecord::Schema.define(version: 20140703032131) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: true do |t|
    t.text     "title"
    t.text     "body"
    t.integer  "user_id"
    t.integer  "comment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["user_id"], name: "index_articles_on_user_id", using: :btree

  create_table "comments", force: true do |t|
    t.text     "content",    null: false
    t.integer  "user_id"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["article_id"], name: "index_comments_on_article_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "downvotes", force: true do |t|
    t.integer "user_id"
    t.integer "article_id"
    t.integer "downvoteable_id"
    t.string  "downvoteable_type"
  end

  add_index "downvotes", ["article_id"], name: "index_downvotes_on_article_id", using: :btree
  add_index "downvotes", ["downvoteable_id", "downvoteable_type"], name: "index_downvotes_on_downvoteable_id_and_downvoteable_type", using: :btree
  add_index "downvotes", ["user_id"], name: "index_downvotes_on_user_id", using: :btree

  create_table "upvotes", force: true do |t|
    t.integer "user_id"
    t.integer "article_id"
    t.integer "upvoteable_id"
    t.string  "upvoteable_type"
  end

  add_index "upvotes", ["article_id"], name: "index_upvotes_on_article_id", using: :btree
  add_index "upvotes", ["upvoteable_id", "upvoteable_type"], name: "index_upvotes_on_upvoteable_id_and_upvoteable_type", using: :btree
  add_index "upvotes", ["user_id"], name: "index_upvotes_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
