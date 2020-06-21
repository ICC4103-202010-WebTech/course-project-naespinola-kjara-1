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

ActiveRecord::Schema.define(version: 2020_06_21_193902) do

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

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "lastname"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "event_id", null: false
    t.string "rich_text"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_comments_on_event_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "dates_to_votes", force: :cascade do |t|
    t.integer "event_id", null: false
    t.datetime "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_dates_to_votes_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "title"
    t.string "description"
    t.boolean "private"
    t.boolean "include_organization"
    t.string "image"
    t.string "videos"
    t.string "documents"
    t.string "location"
    t.string "pictures"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "guests", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "event_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_guests_on_event_id"
    t.index ["user_id"], name: "index_guests_on_user_id"
  end

  create_table "homepages", force: :cascade do |t|
    t.integer "organization_id", null: false
    t.integer "event_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_homepages_on_event_id"
    t.index ["organization_id"], name: "index_homepages_on_organization_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "country"
    t.string "region"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer "user_receiver_id"
    t.integer "user_transmitter_id"
    t.string "text_message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_receiver_id"], name: "index_messages_on_user_receiver_id"
    t.index ["user_transmitter_id"], name: "index_messages_on_user_transmitter_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.string "rich_text"
    t.string "description"
    t.string "videos"
    t.string "documents"
    t.string "pictures"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "location_id", null: false
    t.string "image"
    t.string "document"
    t.string "video"
    t.string "short_bio"
    t.string "name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["location_id"], name: "index_profiles_on_location_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "replies_to_comments", force: :cascade do |t|
    t.integer "comment_receiver_id"
    t.integer "comment_transmitter_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["comment_receiver_id"], name: "index_replies_to_comments_on_comment_receiver_id"
    t.index ["comment_transmitter_id"], name: "index_replies_to_comments_on_comment_transmitter_id"
  end

  create_table "reports", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "event_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_reports_on_event_id"
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "organization_id", null: false
    t.string "username"
    t.string "password"
    t.boolean "is_organization_admin"
    t.boolean "is_system_admin"
    t.boolean "in_blacklist"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["organization_id"], name: "index_users_on_organization_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.integer "guest_id", null: false
    t.integer "dates_to_vote_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dates_to_vote_id"], name: "index_votes_on_dates_to_vote_id"
    t.index ["guest_id"], name: "index_votes_on_guest_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "events"
  add_foreign_key "comments", "users"
  add_foreign_key "dates_to_votes", "events"
  add_foreign_key "events", "users"
  add_foreign_key "guests", "events"
  add_foreign_key "guests", "users"
  add_foreign_key "homepages", "events"
  add_foreign_key "homepages", "organizations"
  add_foreign_key "messages", "users", column: "user_receiver_id"
  add_foreign_key "messages", "users", column: "user_transmitter_id"
  add_foreign_key "profiles", "locations"
  add_foreign_key "profiles", "users"
  add_foreign_key "replies_to_comments", "comments", column: "comment_receiver_id"
  add_foreign_key "replies_to_comments", "comments", column: "comment_transmitter_id"
  add_foreign_key "reports", "events"
  add_foreign_key "reports", "users"
  add_foreign_key "users", "organizations"
  add_foreign_key "votes", "dates_to_votes"
  add_foreign_key "votes", "guests"
end
