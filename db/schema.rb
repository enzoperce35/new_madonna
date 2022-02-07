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

ActiveRecord::Schema.define(version: 2022_02_05_231245) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "inventories", force: :cascade do |t|
    t.bigint "ticket_id"
    t.string "branch"
    t.string "name"
    t.string "type"
    t.string "unit"
    t.float "margin"
    t.float "stock"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ticket_id"], name: "index_inventories_on_ticket_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "ticket_id"
    t.string "branch"
    t.string "name"
    t.string "category"
    t.float "price"
    t.boolean "soft_deleted"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ticket_id"], name: "index_products_on_ticket_id"
  end

  create_table "sales", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "inventory_id"
    t.string "branch"
    t.float "subtractive", default: 1.0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["inventory_id"], name: "index_sales_on_inventory_id"
    t.index ["product_id"], name: "index_sales_on_product_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "ticket_number"
    t.string "author"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "branch"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "inventories", "tickets"
  add_foreign_key "products", "tickets"
  add_foreign_key "sales", "inventories"
  add_foreign_key "sales", "products"
end
