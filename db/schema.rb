# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20171228213928) do

# Could not dump table "ahoy_events" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "approvals", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.integer  "priority_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "asset_id"
    t.boolean  "approved",                default: false
    t.text     "description"
    t.integer  "user_id"
  end

  create_table "assets", force: :cascade do |t|
    t.string   "name",                     limit: 255
    t.text     "summary",                  limit: 255
    t.string   "address",                  limit: 255
    t.string   "city",                     limit: 255
    t.string   "state",                    limit: 255
    t.string   "zipcode",                  limit: 255
    t.string   "year_built",               limit: 255
    t.integer  "size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "property_class",           limit: 255
    t.integer  "property_type",            limit: 255
    t.integer  "client_id"
    t.string   "asset_image_file_name",    limit: 255
    t.string   "asset_image_content_type", limit: 255
    t.integer  "asset_image_file_size"
    t.datetime "asset_image_updated_at"
    t.integer  "percent_leased"
  end

  create_table "brokers", force: :cascade do |t|
    t.integer  "asset_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "budgets", force: :cascade do |t|
    t.integer  "asset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "amount",     precision: 12, scale: 3
  end

  create_table "business_plans", force: :cascade do |t|
    t.integer  "asset_id"
    t.string   "title",                          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "business_plan_doc_file_name",    limit: 255
    t.string   "business_plan_doc_content_type", limit: 255
    t.integer  "business_plan_doc_file_size"
    t.datetime "business_plan_doc_updated_at"
  end

  create_table "career_applications", force: :cascade do |t|
    t.string   "first_name",                limit: 255
    t.string   "last_name",                 limit: 255
    t.string   "email",                     limit: 255
    t.string   "phone",                     limit: 255
    t.text     "old_cover_letter"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "resume_file_name",          limit: 255
    t.string   "resume_content_type",       limit: 255
    t.integer  "resume_file_size"
    t.datetime "resume_updated_at"
    t.integer  "job_posting_id"
    t.string   "cover_letter_file_name",    limit: 255
    t.string   "cover_letter_content_type", limit: 255
    t.integer  "cover_letter_file_size"
    t.datetime "cover_letter_updated_at"
  end

  create_table "clients", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "address",      limit: 255
    t.string   "phone_number", limit: 255
    t.string   "city",         limit: 255
    t.string   "state",        limit: 255
    t.string   "zipcode",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "credits", force: :cascade do |t|
    t.integer  "budget_id"
    t.decimal  "amount",     precision: 12, scale: 3
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "debits", force: :cascade do |t|
    t.integer  "budget_id"
    t.decimal  "amount",     precision: 12, scale: 3
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documents", force: :cascade do |t|
    t.integer  "folder_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uploaded_file_file_name",    limit: 255
    t.string   "uploaded_file_content_type", limit: 255
    t.integer  "uploaded_file_file_size"
    t.datetime "uploaded_file_updated_at"
  end

  create_table "employment_types", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "executive_teams", force: :cascade do |t|
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
    t.string   "title",      limit: 255
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_member"
  end

  create_table "folders", force: :cascade do |t|
    t.integer  "asset_id"
    t.string   "name",       limit: 255
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "general_contents", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "content",    limit: 255
    t.boolean  "is_blurb"
    t.integer  "section"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hot_points", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.integer  "asset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: :cascade do |t|
    t.integer  "asset_id"
    t.string   "title",                       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "property_image_file_name",    limit: 255
    t.string   "property_image_content_type", limit: 255
    t.integer  "property_image_file_size"
    t.datetime "property_image_updated_at"
  end

  create_table "job_categories", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published"
  end

  create_table "job_postings", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.string   "location",           limit: 255
    t.text     "description"
    t.integer  "job_category_id"
    t.integer  "employment_type"
    t.integer  "minimum_experience"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published",                      default: false
  end

  create_table "minimum_experiences", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "priorities", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "property_classes", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "property_types", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "timelines", force: :cascade do |t|
    t.integer  "asset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "timeline_doc_file_name",    limit: 255
    t.string   "timeline_doc_content_type", limit: 255
    t.integer  "timeline_doc_file_size"
    t.datetime "timeline_doc_updated_at"
  end

  create_table "track_downloads", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "asset_id"
    t.boolean  "folder"
    t.integer  "document_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",               limit: 255
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.integer  "client_id"
    t.boolean  "admin",                              default: false
    t.boolean  "broker",                             default: false
    t.boolean  "is_investor",                        default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "visits", force: :cascade do |t|
    t.uuid     "visitor_id",       limit: 16
    t.string   "ip",               limit: 255
    t.text     "user_agent"
    t.text     "referrer"
    t.text     "landing_page"
    t.integer  "user_id"
    t.string   "referring_domain", limit: 255
    t.string   "search_keyword",   limit: 255
    t.string   "browser",          limit: 255
    t.string   "os",               limit: 255
    t.string   "device_type",      limit: 255
    t.integer  "screen_height"
    t.integer  "screen_width"
    t.string   "country",          limit: 255
    t.string   "region",           limit: 255
    t.string   "city",             limit: 255
    t.string   "postal_code",      limit: 255
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.string   "utm_source",       limit: 255
    t.string   "utm_medium",       limit: 255
    t.string   "utm_term",         limit: 255
    t.string   "utm_content",      limit: 255
    t.string   "utm_campaign",     limit: 255
    t.datetime "started_at"
  end

  add_index "visits", ["id"], name: "sqlite_autoindex_visits_1", unique: true
  add_index "visits", ["user_id"], name: "index_visits_on_user_id"

end
