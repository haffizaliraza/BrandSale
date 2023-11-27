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

ActiveRecord::Schema[7.0].define(version: 2023_11_23_231706) do
  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "image"
    t.string "price"
    t.string "discount"
    t.string "after_discount_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "brand"
  end

  create_table "sites", force: :cascade do |t|
    t.string "url"
    t.string "products"
    t.string "image"
    t.string "product_titile"
    t.string "old_price"
    t.string "new_price"
    t.string "product_url"
    t.string "brand_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_attribute"
  end

end
