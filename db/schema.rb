# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_24_211925) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "answers", force: :cascade do |t|
    t.string "description"
    t.float "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "scale_id", null: false
    t.index ["scale_id"], name: "index_answers_on_scale_id"
  end

  create_table "evaluations", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, default: "2020-09-03 20:06:26", null: false
    t.datetime "updated_at", precision: 6, default: "2020-09-03 20:06:26", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "section"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "responsible_id", default: 1, null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "description"
    t.integer "evaluation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "scale_id", default: 1
    t.index ["evaluation_id"], name: "index_items_on_evaluation_id"
    t.index ["scale_id"], name: "index_items_on_scale_id"
  end

  create_table "scales", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "scores", force: :cascade do |t|
    t.integer "test_id", null: false
    t.float "value"
    t.datetime "created_at", precision: 6, default: "2020-09-03 20:06:26", null: false
    t.datetime "updated_at", precision: 6, default: "2020-09-03 20:06:26", null: false
    t.integer "item_id"
    t.string "description"
    t.index ["item_id"], name: "index_scores_on_item_id"
    t.index ["test_id"], name: "index_scores_on_test_id"
  end

  create_table "tests", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "evaluation_id", null: false
    t.integer "evaluator_id"
    t.integer "evaluated_id"
    t.index ["evaluation_id"], name: "index_tests_on_evaluation_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "picture"
    t.string "name"
    t.string "last_name"
    t.integer "num_identification"
    t.string "place_of_birth"
    t.string "address"
    t.string "appointment"
    t.integer "permission_level", default: 1
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "status"
    t.string "phone_number"
    t.string "disability"
    t.integer "group_id", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["group_id"], name: "index_users_on_group_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "answers", "scales"
  add_foreign_key "items", "evaluations"
  add_foreign_key "items", "scales"
  add_foreign_key "scores", "tests"
  add_foreign_key "tests", "evaluations"
  add_foreign_key "users", "groups"
end
