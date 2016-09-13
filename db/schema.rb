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

ActiveRecord::Schema.define(version: 20160913073645) do

  create_table "answers", force: :cascade do |t|
    t.string   "name",                              null: false
    t.boolean  "is_correct_answer", default: false
    t.text     "description"
    t.integer  "question_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "crawlers", force: :cascade do |t|
    t.string   "url",          null: false
    t.text     "h1_content"
    t.text     "h2_content"
    t.text     "h3_content"
    t.text     "link_content"
    t.text     "term"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.integer  "test_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_results", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "answer_id"
    t.integer  "test_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tests", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "project_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "author_id"
  end

  add_index "tickets", ["author_id"], name: "index_tickets_on_author_id"
  add_index "tickets", ["project_id"], name: "index_tickets_on_project_id"

  create_table "users", force: :cascade do |t|
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.text     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.boolean  "admin",                  default: false
    t.string   "auth_token",             default: ""
  end

  add_index "users", ["auth_token"], name: "index_users_on_auth_token"
  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
