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

ActiveRecord::Schema.define(version: 2020_04_20_020555) do

  create_table "comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "wall_of_comment_id", null: false
    t.string "rich_text"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_comments_on_user_id"
    t.index ["wall_of_comment_id"], name: "index_comments_on_wall_of_comment_id"
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

  create_table "mailboxes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_mailboxes_on_user_id"
  end

  create_table "message_receiveds", force: :cascade do |t|
    t.integer "mailbox_id", null: false
    t.integer "message_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mailbox_id"], name: "index_message_receiveds_on_mailbox_id"
    t.index ["message_id"], name: "index_message_receiveds_on_message_id"
  end

  create_table "message_sents", force: :cascade do |t|
    t.integer "mailbox_id", null: false
    t.integer "message_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mailbox_id"], name: "index_message_sents_on_mailbox_id"
    t.index ["message_id"], name: "index_message_sents_on_message_id"
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
    t.string "video"
    t.string "document"
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
    t.string "email"
    t.string "password"
    t.boolean "is_organization_admin"
    t.boolean "is_system_admin"
    t.boolean "in_blacklist"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_users_on_organization_id"
  end

  create_table "votes", force: :cascade do |t|
    t.integer "guest_id", null: false
    t.integer "dates_to_vote_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dates_to_vote_id"], name: "index_votes_on_dates_to_vote_id"
    t.index ["guest_id"], name: "index_votes_on_guest_id"
  end

  create_table "wall_of_comments", force: :cascade do |t|
    t.integer "event_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_wall_of_comments_on_event_id"
  end

  add_foreign_key "comments", "users"
  add_foreign_key "comments", "wall_of_comments"
  add_foreign_key "dates_to_votes", "events"
  add_foreign_key "events", "users"
  add_foreign_key "guests", "events"
  add_foreign_key "guests", "users"
  add_foreign_key "homepages", "events"
  add_foreign_key "homepages", "organizations"
  add_foreign_key "mailboxes", "users"
  add_foreign_key "message_receiveds", "mailboxes"
  add_foreign_key "message_receiveds", "messages"
  add_foreign_key "message_sents", "mailboxes"
  add_foreign_key "message_sents", "messages"
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
  add_foreign_key "wall_of_comments", "events"
end
