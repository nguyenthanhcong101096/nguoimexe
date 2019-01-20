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

ActiveRecord::Schema.define(version: 20190112161853) do

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
    t.string   "kind",       default: "newfeed"
    t.string   "slug_title"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "context",    limit: 500, null: false
    t.bigint   "post_id"
    t.bigint   "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["post_id"], name: "index_comments_on_post_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "conversations", force: :cascade do |t|
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

  create_table "messages", force: :cascade do |t|
    t.text     "msg"
    t.bigint   "conversation_id",                 null: false
    t.bigint   "user_id",                         null: false
    t.boolean  "read",            default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "post_images", force: :cascade do |t|
    t.bigint   "post_id"
    t.text     "post_image_data"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "describe"
    t.bigint   "user_id",                                  null: false
    t.bigint   "vehicle_kind_id",                          null: false
    t.string   "status",              default: "spending", null: false
    t.text     "featured_image_data"
    t.string   "product_date",        default: "Unknown"
    t.string   "brand",               default: "Unknown",  null: false
    t.float    "registration",        default: 0.0,        null: false
    t.float    "price",               default: 0.0,        null: false
    t.string   "slug_title"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["user_id"], name: "index_posts_on_user_id", using: :btree
    t.index ["vehicle_kind_id"], name: "index_posts_on_vehicle_kind_id", using: :btree
  end

  create_table "user_chats", force: :cascade do |t|
    t.bigint   "conversation_id", null: false
    t.bigint   "user_id",         null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["conversation_id"], name: "index_user_chats_on_conversation_id", using: :btree
    t.index ["user_id", "conversation_id"], name: "index_user_chats_on_user_id_and_conversation_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_user_chats_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "phone",                               null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "address"
    t.string   "username"
    t.text     "avatar_data"
    t.string   "slug_name"
    t.string   "range"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "type_account"
    t.index ["phone"], name: "index_users_on_phone", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "vehicle_kinds", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
