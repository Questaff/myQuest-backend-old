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

ActiveRecord::Schema.define(version: 2020_05_27_151438) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "quests", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.boolean "stored", default: false, null: false
    t.boolean "quest_master_validation", default: false, null: false
    t.boolean "quest_hunter_completion", default: false, null: false
    t.bigint "quest_author_id", null: false
    t.bigint "quest_hunter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uuid", default: ""
    t.index ["quest_author_id"], name: "index_quests_on_quest_author_id"
    t.index ["quest_hunter_id"], name: "index_quests_on_quest_hunter_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "phone_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uuid", default: ""
  end

  add_foreign_key "quests", "users", column: "quest_author_id"
  add_foreign_key "quests", "users", column: "quest_hunter_id"
end
