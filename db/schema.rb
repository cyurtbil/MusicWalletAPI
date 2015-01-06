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

ActiveRecord::Schema.define(version: 20150105000543) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: true do |t|
    t.string  "provider"
    t.string  "uid"
    t.string  "access_token"
    t.string  "scope"
    t.integer "user_id"
  end

  add_index "authentications", ["user_id"], name: "index_authentications_on_user_id", using: :btree

  create_table "songs", force: true do |t|
    t.string  "name"
    t.integer "wallet_id"
  end

  add_index "songs", ["wallet_id"], name: "index_songs_on_wallet_id", using: :btree

  create_table "users", force: true do |t|
    t.string  "username"
    t.string  "image_url"
    t.integer "followers_count"
    t.integer "followings_count"
  end

  create_table "wallets", force: true do |t|
    t.string  "name"
    t.integer "user_id"
  end

  add_index "wallets", ["user_id"], name: "index_wallets_on_user_id", using: :btree

end
