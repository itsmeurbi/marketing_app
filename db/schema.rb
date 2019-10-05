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

ActiveRecord::Schema.define(version: 2019_10_05_043122) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campains", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.string "objective"
    t.integer "campain_type", null: false
    t.string "product"
    t.bigint "manager_id"
    t.index ["manager_id"], name: "index_campains_on_manager_id"
  end

  create_table "clients", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "corporation_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["corporation_id"], name: "index_clients_on_corporation_id"
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "legal_representant_name", null: false
    t.string "legal_representant_email", null: false
    t.string "legal_representant_phone", null: false
    t.string "legal_representant_role", null: false
    t.string "bussines_name", null: false
    t.string "rfc", null: false
    t.string "location", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "corporation_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["corporation_id"], name: "index_contacts_on_corporation_id"
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "corporations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "legal_representant_name", null: false
    t.string "legal_representant_email", null: false
    t.string "legal_representant_phone", null: false
    t.string "legal_representant_role", null: false
  end

  create_table "coworkers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "campain_id", null: false
    t.integer "role", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["campain_id"], name: "index_coworkers_on_campain_id"
    t.index ["user_id"], name: "index_coworkers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "roles_mask"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.integer "invited_by_id"
    t.string "invited_by_type"
    t.bigint "company_id"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "campains", "users", column: "manager_id"
end
