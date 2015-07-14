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

ActiveRecord::Schema.define(version: 20131207110234527) do

  create_table "activities", force: true do |t|
    t.integer  "user_id"
    t.string   "action"
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "author_id"
    t.boolean  "read",           default: false
  end

  add_index "activities", ["author_id"], name: "index_activities_on_author_id"
  add_index "activities", ["trackable_id"], name: "index_activities_on_trackable_id"
  add_index "activities", ["user_id"], name: "index_activities_on_user_id"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price"
    t.text     "second_name"
    t.integer  "parent_id"
    t.string   "slug"
  end

  add_index "categories", ["parent_id"], name: "index_categories_on_parent_id"
  add_index "categories", ["slug"], name: "index_categories_on_slug"

  create_table "cities", force: true do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.text     "body"
    t.integer  "user_id"
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["attachable_id", "attachable_type"], name: "index_comments_on_attachable_id_and_attachable_type"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "conversations", force: true do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "conversations", ["recipient_id"], name: "index_conversations_on_recipient_id"
  add_index "conversations", ["sender_id"], name: "index_conversations_on_sender_id"

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority"

  create_table "ecategories", force: true do |t|
    t.text     "name"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ecategories", ["parent_id"], name: "index_ecategories_on_parent_id"

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "messages", force: true do |t|
    t.text     "body"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id"
  add_index "messages", ["user_id"], name: "index_messages_on_user_id"

  create_table "posts", force: true do |t|
    t.string   "name"
    t.text     "content"
    t.date     "date"
    t.time     "time"
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price"
    t.string   "adress1"
    t.string   "adress2"
    t.integer  "executor_id"
    t.integer  "status",             default: 1
    t.integer  "count",              default: 0
    t.string   "phone"
    t.integer  "city_id"
    t.integer  "statusfromexecutor", default: 5
    t.decimal  "finalcustomerprice"
    t.decimal  "finalexecutorprice"
    t.string   "slug"
  end

  add_index "posts", ["category_id"], name: "index_posts_on_category_id"
  add_index "posts", ["city_id"], name: "index_posts_on_city_id"
  add_index "posts", ["executor_id"], name: "index_posts_on_executor_id"
  add_index "posts", ["slug"], name: "index_posts_on_slug"
  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "rates", force: true do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "stars",         null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rates", ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type"
  add_index "rates", ["rater_id"], name: "index_rates_on_rater_id"

  create_table "rating_caches", force: true do |t|
    t.integer  "cacheable_id"
    t.string   "cacheable_type"
    t.float    "avg",            null: false
    t.integer  "qty",            null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rating_caches", ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type"

  create_table "responces", force: true do |t|
    t.string   "comment"
    t.integer  "price"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "post_id"
  end

  add_index "responces", ["post_id"], name: "index_responces_on_post_id"
  add_index "responces", ["user_id"], name: "index_responces_on_user_id"

  create_table "reviews", force: true do |t|
    t.text     "body"
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "for_user_id"
    t.decimal  "customer_price"
    t.decimal  "executor_price"
    t.decimal  "status"
    t.integer  "negative",       default: 0
  end

  add_index "reviews", ["for_user_id"], name: "index_reviews_on_for_user_id"
  add_index "reviews", ["post_id"], name: "index_reviews_on_post_id"
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone"
    t.string   "name"
    t.string   "avatar"
    t.date     "birthday"
    t.integer  "city_id"
    t.boolean  "gender"
    t.text     "about"
    t.text     "serviceprice"
    t.decimal  "hourprice"
    t.string   "last_name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "slug"
  end

  add_index "users", ["city_id"], name: "index_users_on_city_id"
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["slug"], name: "index_users_on_slug"

  create_table "users_categories", force: true do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users_categories", ["category_id"], name: "index_users_categories_on_category_id"
  add_index "users_categories", ["user_id"], name: "index_users_categories_on_user_id"

  create_table "users_ecategories", force: true do |t|
    t.integer  "user_id"
    t.integer  "ecategory_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users_ecategories", ["ecategory_id"], name: "index_users_ecategories_on_ecategory_id"
  add_index "users_ecategories", ["user_id"], name: "index_users_ecategories_on_user_id"

  create_table "users_roles", force: true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users_roles", ["role_id"], name: "index_users_roles_on_role_id"
  add_index "users_roles", ["user_id"], name: "index_users_roles_on_user_id"

  create_table "verifications", force: true do |t|
    t.text     "first_name"
    t.text     "last_name"
    t.text     "second_name"
    t.date     "birthday"
    t.string   "phone"
    t.text     "tpname"
    t.text     "tprelation"
    t.string   "tpphone"
    t.text     "tp1name"
    t.text     "tp1relation"
    t.string   "tp1phone"
    t.boolean  "firstverification"
    t.boolean  "verificationinformright"
    t.boolean  "kzcitizen"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "verifications", ["user_id"], name: "index_verifications_on_user_id"

end
