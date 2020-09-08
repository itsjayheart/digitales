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

ActiveRecord::Schema.define(version: 2020_09_04_005828) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achron_storylines", force: :cascade do |t|
    t.bigint "creatrix_id"
    t.string "hexanyme"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creatrix_id"], name: "index_achron_storylines_on_creatrix_id"
  end

  create_table "actions", force: :cascade do |t|
    t.string "hexanyme"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "alt_node_relations", force: :cascade do |t|
    t.string "hexanyme"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "characters", force: :cascade do |t|
    t.string "hexanyme"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chron_storylines", force: :cascade do |t|
    t.bigint "creatrix_id"
    t.string "hexanyme"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creatrix_id"], name: "index_chron_storylines_on_creatrix_id"
  end

  create_table "creatrixes", force: :cascade do |t|
    t.string "hexanyme"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_creatrixes_on_email", unique: true
    t.index ["reset_password_token"], name: "index_creatrixes_on_reset_password_token", unique: true
  end

  create_table "digits", force: :cascade do |t|
    t.bigint "creatrix_id"
    t.string "hexanyme"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creatrix_id"], name: "index_digits_on_creatrix_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "hexanyme"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "hexanyme"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "m_statements", force: :cascade do |t|
    t.bigint "creatrix_id"
    t.string "hexanyme"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creatrix_id"], name: "index_m_statements_on_creatrix_id"
  end

  create_table "meanwhile_node_relations", force: :cascade do |t|
    t.string "hexanyme"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "node_story_cache_relations", force: :cascade do |t|
    t.bigint "node_id"
    t.bigint "story_cache_id"
    t.string "hexanyme"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["node_id"], name: "index_node_story_cache_relations_on_node_id"
    t.index ["story_cache_id"], name: "index_node_story_cache_relations_on_story_cache_id"
  end

  create_table "nodes", force: :cascade do |t|
    t.string "nodeable_type"
    t.bigint "nodeable_id"
    t.bigint "creatrix_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creatrix_id"], name: "index_nodes_on_creatrix_id"
    t.index ["nodeable_type", "nodeable_id"], name: "index_nodes_on_nodeable_type_and_nodeable_id"
  end

  create_table "non_recurring_events", force: :cascade do |t|
    t.string "hexanyme"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "or_else_node_relations", force: :cascade do |t|
    t.string "hexanyme"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "other_settings", force: :cascade do |t|
    t.string "hexanyme"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parented_node_relations", force: :cascade do |t|
    t.bigint "parented_node_one_id"
    t.bigint "parented_node_two_id"
    t.string "hexanyme"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parented_node_one_id"], name: "index_parented_node_relations_on_parented_node_one_id"
    t.index ["parented_node_two_id"], name: "index_parented_node_relations_on_parented_node_two_id"
  end

  create_table "primary_settings", force: :cascade do |t|
    t.string "prim_setting_type"
    t.bigint "prim_setting_id"
    t.string "hexanyme"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prim_setting_type", "prim_setting_id"], name: "index_primary_settings_on_prim_setting_type_and_prim_setting_id"
  end

  create_table "professions", force: :cascade do |t|
    t.string "hexanyme"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prophecies", force: :cascade do |t|
    t.string "hexanyme"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "races", force: :cascade do |t|
    t.string "hexanyme"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recurring_events", force: :cascade do |t|
    t.string "hexanyme"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "secondary_settings", force: :cascade do |t|
    t.string "sec_setting_type"
    t.bigint "sec_setting_id"
    t.string "hexanyme"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sec_setting_type", "sec_setting_id"], name: "index_secondary_settings_on_sec_setting_type_and_sec_setting_id"
  end

  create_table "settings", force: :cascade do |t|
    t.bigint "creatrix_id"
    t.string "setting_type_type"
    t.bigint "setting_type_id"
    t.string "hexanyme"
    t.string "full_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creatrix_id"], name: "index_settings_on_creatrix_id"
    t.index ["setting_type_type", "setting_type_id"], name: "index_settings_on_setting_type_type_and_setting_type_id"
  end

  create_table "simult_node_relations", force: :cascade do |t|
    t.string "hexanyme"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "story_caches", force: :cascade do |t|
    t.bigint "creatrix_id"
    t.string "hexanyme"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creatrix_id"], name: "index_story_caches_on_creatrix_id"
  end

  create_table "tales", force: :cascade do |t|
    t.bigint "creatrix_id"
    t.string "hexanyme"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creatrix_id"], name: "index_tales_on_creatrix_id"
  end

  create_table "tertiary_settings", force: :cascade do |t|
    t.string "ter_setting_type"
    t.bigint "ter_setting_id"
    t.string "hexanyme"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ter_setting_type", "ter_setting_id"], name: "index_tertiary_settings_on_ter_setting_type_and_ter_setting_id"
  end

  create_table "then_node_relations", force: :cascade do |t|
    t.string "hexanyme"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tree_codes", force: :cascade do |t|
    t.bigint "node_id"
    t.integer "or_else_node_order"
    t.integer "meanwhile_node_order"
    t.integer "then_node_order"
    t.integer "alt_node_order"
    t.integer "simult_node_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["node_id"], name: "index_tree_codes_on_node_id"
  end

  create_table "tree_node_relations", force: :cascade do |t|
    t.bigint "root_tree_node_id"
    t.bigint "rooted_tree_node_id"
    t.string "tree_link_type"
    t.bigint "tree_link_id"
    t.string "hexanyme"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["root_tree_node_id"], name: "index_tree_node_relations_on_root_tree_node_id"
    t.index ["rooted_tree_node_id"], name: "index_tree_node_relations_on_rooted_tree_node_id"
    t.index ["tree_link_type", "tree_link_id"], name: "index_tree_node_relations_on_tree_link_type_and_tree_link_id"
  end

  create_table "views", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_views_on_email", unique: true
    t.index ["reset_password_token"], name: "index_views_on_reset_password_token", unique: true
  end

  create_table "what_ifs", force: :cascade do |t|
    t.bigint "creatrix_id"
    t.string "hexanyme"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creatrix_id"], name: "index_what_ifs_on_creatrix_id"
  end

end
