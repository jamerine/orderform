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

ActiveRecord::Schema.define(version: 20170307053259) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "business_name",          null: false
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "city"
    t.string   "state"
    t.integer  "zip_code"
    t.string   "country"
    t.string   "website"
    t.string   "phone_number"
    t.string   "phone_number_extension"
    t.string   "fax_number"
    t.string   "email_address"
    t.string   "subdomain",              null: false
    t.string   "logo"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["subdomain"], name: "index_accounts_on_subdomain", unique: true, using: :btree
  end

  create_table "colors", force: :cascade do |t|
    t.string   "name"
    t.string   "hex_color"
    t.string   "color_sample"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "size_id"
    t.integer  "color_id"
    t.integer  "order_id"
    t.decimal  "unit_price",  precision: 12, scale: 3
    t.integer  "quantity"
    t.decimal  "total_price", precision: 12, scale: 3
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["color_id"], name: "index_order_items_on_color_id", using: :btree
    t.index ["order_id"], name: "index_order_items_on_order_id", using: :btree
    t.index ["product_id"], name: "index_order_items_on_product_id", using: :btree
    t.index ["size_id"], name: "index_order_items_on_size_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "status"
    t.decimal  "subtotal",     precision: 12, scale: 3
    t.decimal  "tax",          precision: 12, scale: 3
    t.decimal  "shipping",     precision: 12, scale: 3
    t.decimal  "total",        precision: 12, scale: 3
    t.integer  "account_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone_number"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["account_id"], name: "index_orders_on_account_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",                            null: false
    t.string   "description",                     null: false
    t.string   "item_number"
    t.string   "style_number",                    null: false
    t.string   "vendor"
    t.boolean  "active",           default: true
    t.string   "product_page_url"
    t.string   "product_image"
    t.integer  "account_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["account_id"], name: "index_products_on_account_id", using: :btree
  end

  create_table "products_colors", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "color_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["color_id"], name: "index_products_colors_on_color_id", using: :btree
    t.index ["product_id"], name: "index_products_colors_on_product_id", using: :btree
  end

  create_table "products_sizes", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "size_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_products_sizes_on_product_id", using: :btree
    t.index ["size_id"], name: "index_products_sizes_on_size_id", using: :btree
  end

  create_table "sizes", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price",      precision: 12, scale: 3
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "order_items", "colors"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "order_items", "sizes"
  add_foreign_key "products", "accounts"
  add_foreign_key "products_colors", "colors"
  add_foreign_key "products_colors", "products"
  add_foreign_key "products_sizes", "products"
  add_foreign_key "products_sizes", "sizes"
end
