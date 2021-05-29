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

ActiveRecord::Schema.define(version: 2021_05_29_073828) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.bigint "users_id"
    t.string "address"
    t.string "location"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["users_id"], name: "index_addresses_on_users_id"
  end

  create_table "cart_items", force: :cascade do |t|
    t.bigint "carts_id"
    t.bigint "shop_items_id"
    t.integer "quantity", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["carts_id"], name: "index_cart_items_on_carts_id"
    t.index ["shop_items_id"], name: "index_cart_items_on_shop_items_id"
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "users_id"
    t.bigint "shops_id"
    t.float "total_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shops_id"], name: "index_carts_on_shops_id"
    t.index ["users_id"], name: "index_carts_on_users_id"
  end

  create_table "delivery_people", force: :cascade do |t|
    t.bigint "users_id"
    t.string "license"
    t.string "vehicle_no"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["users_id"], name: "index_delivery_people_on_users_id"
  end

  create_table "delivery_person_locations", force: :cascade do |t|
    t.bigint "delivery_peoples_id"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["delivery_peoples_id"], name: "index_delivery_person_locations_on_delivery_peoples_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "product_category"
    t.float "price", null: false
    t.integer "quantity", default: 0, null: false
    t.string "sku_details"
    t.string "barcode"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "users_id"
    t.bigint "delivery_peoples_id"
    t.bigint "shops_id"
    t.bigint "carts_id"
    t.string "status"
    t.float "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["carts_id"], name: "index_orders_on_carts_id"
    t.index ["delivery_peoples_id"], name: "index_orders_on_delivery_peoples_id"
    t.index ["shops_id"], name: "index_orders_on_shops_id"
    t.index ["users_id"], name: "index_orders_on_users_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "orders_id"
    t.string "payment_link"
    t.string "status"
    t.string "payment_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["orders_id"], name: "index_payments_on_orders_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.string "rating_type"
    t.bigint "rating_id"
    t.bigint "orders_id"
    t.integer "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["orders_id"], name: "index_ratings_on_orders_id"
    t.index ["rating_id"], name: "index_ratings_on_rating_id"
    t.index ["rating_type"], name: "index_ratings_on_rating_type"
  end

  create_table "shop_items", force: :cascade do |t|
    t.bigint "shops_id"
    t.bigint "items_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["items_id"], name: "index_shop_items_on_items_id"
    t.index ["shops_id"], name: "index_shop_items_on_shops_id"
  end

  create_table "shop_owners", force: :cascade do |t|
    t.bigint "users_id"
    t.string "registration_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["users_id"], name: "index_shop_owners_on_users_id"
  end

  create_table "shops", force: :cascade do |t|
    t.bigint "shop_owners_id"
    t.string "name"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_owners_id"], name: "index_shops_on_shop_owners_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password", null: false
    t.string "phone", null: false
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["password"], name: "index_users_on_password"
    t.index ["type"], name: "index_users_on_type"
  end

end
