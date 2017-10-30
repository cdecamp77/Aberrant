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

ActiveRecord::Schema.define(version: 20171029234957) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "offers", force: :cascade do |t|
    t.string "user_name"
    t.text "input"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trades", force: :cascade do |t|
    t.string "trade_name"
    t.text "description"
    t.string "trade_image_file_name"
    t.string "trade_image_content_type"
    t.integer "trade_image_file_size"
    t.datetime "trade_image_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "offer_id"
    t.index ["offer_id"], name: "index_trades_on_offer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "phone"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "trade_id"
    t.bigint "offer_id"
    t.index ["offer_id"], name: "index_users_on_offer_id"
    t.index ["trade_id"], name: "index_users_on_trade_id"
  end

  add_foreign_key "trades", "offers"
  add_foreign_key "users", "offers"
  add_foreign_key "users", "trades"
end
