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

ActiveRecord::Schema.define(version: 2020_09_14_081143) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievement_categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "achievements", force: :cascade do |t|
    t.bigint "achievement_category_id"
    t.bigint "node_id"
    t.boolean "achieved?", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["achievement_category_id"], name: "index_achievements_on_achievement_category_id"
    t.index ["node_id"], name: "index_achievements_on_node_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
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

  create_table "creatrixes", force: :cascade do |t|
    t.string "hexanyme"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_creatrixes_on_email", unique: true
    t.index ["reset_password_token"], name: "index_creatrixes_on_reset_password_token", unique: true
  end

  create_table "digits", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "creatrix_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creatrix_id"], name: "index_digits_on_creatrix_id"
  end

  create_table "donated_sums", force: :cascade do |t|
    t.decimal "sum"
    t.bigint "fundraiser_id"
    t.bigint "creatrix_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creatrix_id"], name: "index_donated_sums_on_creatrix_id"
    t.index ["fundraiser_id"], name: "index_donated_sums_on_fundraiser_id"
  end

  create_table "fundraisers", force: :cascade do |t|
    t.bigint "creatrix_id"
    t.bigint "microservice_request_id"
    t.boolean "funded?"
    t.decimal "goal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creatrix_id"], name: "index_fundraisers_on_creatrix_id"
    t.index ["microservice_request_id"], name: "index_fundraisers_on_microservice_request_id"
  end

  create_table "m_statements", force: :cascade do |t|
    t.string "sentence"
    t.text "description"
    t.bigint "creatrix_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creatrix_id"], name: "index_m_statements_on_creatrix_id"
  end

  create_table "microservice_categories", force: :cascade do |t|
    t.bigint "achievement_category_id"
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "media_type"
    t.index ["achievement_category_id"], name: "index_microservice_categories_on_achievement_category_id"
  end

  create_table "microservice_requests", force: :cascade do |t|
    t.bigint "achievement_id"
    t.bigint "microservice_id"
    t.boolean "accepted?", default: false
    t.boolean "delivered?", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["achievement_id"], name: "index_microservice_requests_on_achievement_id"
    t.index ["microservice_id"], name: "index_microservice_requests_on_microservice_id"
  end

  create_table "microservices", force: :cascade do |t|
    t.decimal "price"
    t.bigint "microservice_category_id"
    t.bigint "creatrix_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "youtube"
    t.text "soundcloude"
    t.text "quill"
    t.index ["creatrix_id"], name: "index_microservices_on_creatrix_id"
    t.index ["microservice_category_id"], name: "index_microservices_on_microservice_category_id"
  end

  create_table "node_achievement_relations", force: :cascade do |t|
    t.bigint "node_id"
    t.bigint "achievement_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["achievement_id"], name: "index_node_achievement_relations_on_achievement_id"
    t.index ["node_id"], name: "index_node_achievement_relations_on_node_id"
  end

  create_table "nodes", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "creatrix_id"
    t.string "nodeable_type"
    t.bigint "nodeable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creatrix_id"], name: "index_nodes_on_creatrix_id"
    t.index ["nodeable_type", "nodeable_id"], name: "index_nodes_on_nodeable_type_and_nodeable_id"
  end

  create_table "settings", force: :cascade do |t|
    t.string "full_name"
    t.text "description"
    t.bigint "creatrix_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creatrix_id"], name: "index_settings_on_creatrix_id"
  end

  create_table "tales", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "creatrix_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creatrix_id"], name: "index_tales_on_creatrix_id"
  end

  create_table "what_ifs", force: :cascade do |t|
    t.string "sentence"
    t.text "description"
    t.bigint "creatrix_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creatrix_id"], name: "index_what_ifs_on_creatrix_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
