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

ActiveRecord::Schema.define(version: 20190317102650) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "activities", force: :cascade do |t|
    t.bigint   "user_id",                        null: false
    t.bigint   "target_user_id",                 null: false
    t.string   "kind"
    t.string   "message"
    t.string   "url"
    t.boolean  "read",           default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "blogs", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.text     "img_data"
    t.bigint   "user_id"
    t.string   "kind",          default: "newfeed"
    t.string   "mod",           default: "public"
    t.integer  "like_count"
    t.integer  "view_count"
    t.integer  "comment_count"
    t.string   "slug_title"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.bigint   "vehicle_kind_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.bigint   "province_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["province_id"], name: "index_cities_on_province_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.string   "context",          limit: 500, null: false
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.bigint   "user_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "conversations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enterprises", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.bigint   "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "follows", force: :cascade do |t|
    t.bigint   "user_id",        null: false
    t.bigint   "target_user_id", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["target_user_id"], name: "index_follows_on_target_user_id", using: :btree
    t.index ["user_id", "target_user_id"], name: "index_follows_on_user_id_and_target_user_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_follows_on_user_id", using: :btree
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.bigint   "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_groups_on_name", unique: true, using: :btree
    t.index ["user_id"], name: "index_groups_on_user_id", using: :btree
  end

  create_table "likes", force: :cascade do |t|
    t.bigint   "user_id"
    t.integer  "likeable_id"
    t.string   "likeable_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["user_id", "likeable_id", "likeable_type"], name: "index_likes_on_user_id_and_likeable_id_and_likeable_type", unique: true, using: :btree
    t.index ["user_id"], name: "index_likes_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.text     "msg"
    t.text     "attachment_data"
    t.bigint   "conversation_id",                 null: false
    t.bigint   "sender_id",                       null: false
    t.boolean  "read",            default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
    t.index ["sender_id"], name: "index_messages_on_sender_id", using: :btree
  end

  create_table "post_images", force: :cascade do |t|
    t.text     "post_image_data"
    t.integer  "post_imageable_id"
    t.string   "post_imageable_type"
    t.string   "url",                 default: "Unknow"
    t.string   "public_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "post_views", force: :cascade do |t|
    t.integer  "post_id",    null: false
    t.integer  "user_id"
    t.inet     "ip_address", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id", "ip_address"], name: "index_post_views_on_post_id_and_ip_address", using: :btree
    t.index ["post_id", "user_id"], name: "index_post_views_on_post_id_and_user_id", using: :btree
    t.index ["post_id"], name: "index_post_views_on_post_id", using: :btree
    t.index ["user_id"], name: "index_post_views_on_user_id", using: :btree
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "describe"
    t.bigint   "user_id",                                   null: false
    t.bigint   "vehicle_kind_id",                           null: false
    t.string   "status",               default: "spending", null: false
    t.text     "featured_image_data"
    t.string   "car_life",             default: "Unknown"
    t.string   "capacity",             default: "Unknown"
    t.string   "range_of_vehicle",     default: "Unknown"
    t.string   "status_of_vehicle"
    t.float    "price",                default: 0.0,        null: false
    t.string   "year_of_registration", default: "Unknown"
    t.string   "km",                   default: "Unknown"
    t.string   "slug_title"
    t.bigint   "city_id"
    t.string   "color",                default: "Unknown"
    t.integer  "views_count",          default: 0,          null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.index ["user_id"], name: "index_posts_on_user_id", using: :btree
    t.index ["vehicle_kind_id"], name: "index_posts_on_vehicle_kind_id", using: :btree
  end

  create_table "provinces", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "room_chats", force: :cascade do |t|
    t.bigint   "conversation_id", null: false
    t.bigint   "sender_id",       null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["conversation_id"], name: "index_room_chats_on_conversation_id", using: :btree
    t.index ["sender_id", "conversation_id"], name: "index_room_chats_on_sender_id_and_conversation_id", unique: true, using: :btree
    t.index ["sender_id"], name: "index_room_chats_on_sender_id", using: :btree
  end

  create_table "user_groups", force: :cascade do |t|
    t.bigint   "user_id"
    t.bigint   "group_id"
    t.string   "role",       default: "member"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["group_id"], name: "index_user_groups_on_group_id", using: :btree
    t.index ["user_id", "group_id"], name: "index_user_groups_on_user_id_and_group_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_user_groups_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "phone"
    t.string   "encrypted_password",     default: "",        null: false
    t.string   "address"
    t.string   "username"
    t.text     "avatar_data"
    t.string   "slug_name"
    t.string   "range"
    t.string   "status",                 default: "offline"
    t.integer  "followers_count"
    t.integer  "following_count"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "type_account"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "vehicle_kinds", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicle_models", force: :cascade do |t|
    t.string   "name"
    t.bigint   "brand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
