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

ActiveRecord::Schema.define(version: 2018_11_16_213127) do

  create_table "attachments", force: :cascade do |t|
    t.string "file"
    t.integer "doc_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.index ["doc_id"], name: "index_attachments_on_doc_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.string "pub_name"
    t.string "pub_year"
    t.string "edit_num"
    t.integer "page"
    t.string "series_name"
    t.string "remark"
    t.string "isbn"
    t.integer "copy"
    t.string "keyword"
    t.decimal "price"
    t.string "barcode"
    t.string "book_class"
    t.string "shelf_class"
    t.string "shelf_num"
    t.datetime "record_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
  end

  create_table "comments", force: :cascade do |t|
    t.text "text"
    t.integer "doc_id"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "state_id"
    t.integer "previous_state_id"
    t.index ["author_id"], name: "index_comments_on_author_id"
    t.index ["doc_id"], name: "index_comments_on_doc_id"
    t.index ["previous_state_id"], name: "index_comments_on_previous_state_id"
    t.index ["state_id"], name: "index_comments_on_state_id"
  end

  create_table "csv_exports", force: :cascade do |t|
    t.string "status"
    t.string "csv_file"
    t.string "export_type", default: "doc"
    t.integer "user_id"
    t.integer "total_count"
    t.integer "success_count"
    t.text "error_messages"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "csv_imports", force: :cascade do |t|
    t.string "status"
    t.string "csv_file"
    t.string "import_type", default: "doc"
    t.integer "user_id"
    t.integer "total_count"
    t.integer "success_count"
    t.text "error_message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "doc_deliveries", force: :cascade do |t|
    t.integer "doc_id"
    t.integer "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_doc_deliveries_on_department_id"
    t.index ["doc_id"], name: "index_doc_deliveries_on_doc_id"
  end

  create_table "docs", force: :cascade do |t|
    t.string "origin"
    t.string "name"
    t.datetime "receive"
    t.datetime "publish"
    t.text "description"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.integer "journal_id"
    t.integer "editor_id"
    t.integer "state_id"
    t.string "status", default: "available"
    t.string "level", default: "sensitive"
    t.string "images"
    t.index ["editor_id"], name: "index_docs_on_editor_id"
    t.index ["journal_id"], name: "index_docs_on_journal_id"
    t.index ["state_id"], name: "index_docs_on_state_id"
  end

  create_table "docs_tags", id: false, force: :cascade do |t|
    t.integer "tag_id", null: false
    t.integer "doc_id", null: false
    t.index ["doc_id", "tag_id"], name: "index_docs_tags_on_doc_id_and_tag_id"
    t.index ["tag_id", "doc_id"], name: "index_docs_tags_on_tag_id_and_doc_id"
  end

  create_table "items", force: :cascade do |t|
    t.integer "doc_id"
    t.string "owner"
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doc_id"], name: "index_items_on_doc_id"
  end

  create_table "journal_deliveries", force: :cascade do |t|
    t.integer "journal_id"
    t.integer "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_journal_deliveries_on_department_id"
    t.index ["journal_id"], name: "index_journal_deliveries_on_journal_id"
  end

  create_table "journals", force: :cascade do |t|
    t.string "name"
    t.string "publisher"
    t.integer "interval"
    t.integer "amount"
    t.string "delivery"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "shortname"
    t.integer "row_order"
    t.string "logo"
    t.string "image"
    t.index ["row_order"], name: "index_journals_on_row_order"
    t.index ["shortname"], name: "index_journals_on_shortname", unique: true
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "quantity"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  create_table "roles", force: :cascade do |t|
    t.integer "user_id"
    t.string "role"
    t.integer "journal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["journal_id"], name: "index_roles_on_journal_id"
    t.index ["user_id"], name: "index_roles_on_user_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "default", default: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: ""
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_admin", default: false
    t.datetime "archived_at"
    t.string "cname", default: ""
    t.string "username"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object", limit: 1073741823
    t.datetime "created_at"
    t.text "object_changes", limit: 1073741823
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

end
