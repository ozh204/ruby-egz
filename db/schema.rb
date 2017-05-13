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

ActiveRecord::Schema.define(version: 20170513174557) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "order_waffles", force: :cascade do |t|
    t.integer "quantity"
    t.integer "waffle_id"
    t.integer "order_id"
    t.index ["order_id"], name: "index_order_waffles_on_order_id", using: :btree
    t.index ["waffle_id"], name: "index_order_waffles_on_waffle_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.float    "price"
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "shop_id"
    t.index ["shop_id"], name: "index_orders_on_shop_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
    t.index ["name"], name: "index_roles_on_name", using: :btree
  end

  create_table "shops", force: :cascade do |t|
    t.string   "nazwa"
    t.string   "lokalizacja"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree
  end

  create_table "waffles", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "image"
    t.boolean  "discount",   default: false
  end

  create_table "widgets", id: false, force: :cascade do |t|
  end

end
