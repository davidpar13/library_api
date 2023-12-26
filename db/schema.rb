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

ActiveRecord::Schema[7.0].define(version: 2023_12_26_194323) do
  create_table "books", force: :cascade do |t|
    t.string "isbn"
    t.string "title"
    t.string "author"
    t.integer "library_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "checked_out"
    t.date "return_by"
    t.string "availability"
    t.index ["library_id"], name: "index_books_on_library_id"
  end

  create_table "fees", force: :cascade do |t|
    t.boolean "paid"
    t.decimal "amount"
    t.integer "membership_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "book_id_id"
    t.index ["book_id_id"], name: "index_fees_on_book_id_id"
    t.index ["membership_id"], name: "index_fees_on_membership_id"
  end

  create_table "libraries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "card_number"
    t.string "expiration_date"
    t.string "cvv"
  end

  create_table "memberships", force: :cascade do |t|
    t.integer "member_id", null: false
    t.integer "library_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["library_id"], name: "index_memberships_on_library_id"
    t.index ["member_id"], name: "index_memberships_on_member_id"
  end

  create_table "rental_transactions", force: :cascade do |t|
    t.datetime "checked_out_on"
    t.datetime "returned_on"
    t.integer "library_id", null: false
    t.integer "book_id", null: false
    t.integer "membership_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_rental_transactions_on_book_id"
    t.index ["library_id"], name: "index_rental_transactions_on_library_id"
    t.index ["membership_id"], name: "index_rental_transactions_on_membership_id"
  end

  add_foreign_key "books", "libraries"
  add_foreign_key "fees", "memberships"
  add_foreign_key "memberships", "libraries"
  add_foreign_key "memberships", "members"
  add_foreign_key "rental_transactions", "books"
  add_foreign_key "rental_transactions", "libraries"
  add_foreign_key "rental_transactions", "memberships"
end
