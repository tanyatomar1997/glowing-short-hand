# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_09_29_132520) do
  create_table "api_keys", force: :cascade do |t|
    t.string "access_token"
    t.string "secret_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["access_token"], name: "index_api_keys_on_access_token", unique: true
    t.index ["secret_key"], name: "index_api_keys_on_secret_key", unique: true
  end

  create_table "short_urls", force: :cascade do |t|
    t.text "original_url"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_short_urls_on_slug"
  end

  create_table "urls", force: :cascade do |t|
    t.text "original_url"
    t.string "short_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["short_code"], name: "index_urls_on_short_code"
  end
end
