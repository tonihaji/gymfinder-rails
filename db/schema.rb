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

ActiveRecord::Schema[7.0].define(version: 2023_04_01_114336) do
  create_table "admins", force: :cascade do |t|
    t.string "adminname"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gyms", force: :cascade do |t|
    t.string "image"
    t.string "name"
    t.string "location"
    t.string "operatingHours"
    t.integer "price"
    t.integer "contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "admin_id", null: false
    t.index ["admin_id"], name: "index_gyms_on_admin_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "gym_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gym_id"], name: "index_users_on_gym_id"
  end

  add_foreign_key "gyms", "admins"
  add_foreign_key "users", "gyms"
end
