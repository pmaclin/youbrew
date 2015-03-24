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

ActiveRecord::Schema.define(version: 20150324052739) do

  create_table "batches", force: :cascade do |t|
    t.string   "size"
    t.string   "brew_date"
    t.string   "bottle_date"
    t.float    "aog"
    t.float    "afg"
    t.float    "aabv"
    t.string   "aaroma"
    t.integer  "aibu"
    t.string   "image"
    t.text     "aflavpro"
    t.integer  "user_id"
    t.integer  "recipe_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "batches", ["recipe_id"], name: "index_batches_on_recipe_id"
  add_index "batches", ["user_id"], name: "index_batches_on_user_id"

  create_table "recipes", force: :cascade do |t|
    t.string   "name"
    t.string   "brew_type"
    t.text     "description"
    t.float    "tog"
    t.float    "tfg"
    t.float    "tabv"
    t.string   "taroma"
    t.integer  "tibu"
    t.string   "label"
    t.text     "tflavpro"
    t.integer  "user_id"
    t.integer  "style_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "recipes", ["style_id"], name: "index_recipes_on_style_id"
  add_index "recipes", ["user_id"], name: "index_recipes_on_user_id"

  create_table "reviews", force: :cascade do |t|
    t.string   "headline"
    t.text     "content"
    t.integer  "overall_rating"
    t.integer  "user_id"
    t.integer  "batch_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "reviews", ["batch_id"], name: "index_reviews_on_batch_id"
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "styles", force: :cascade do |t|
    t.string   "name"
    t.text     "std_flavor_profile"
    t.string   "com_ex_image"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.string   "username"
    t.boolean  "you_brew"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
