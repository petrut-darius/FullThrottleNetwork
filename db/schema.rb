# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_08_11_203052) do
  create_table "admin_users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "forum_forums", force: :cascade do |t|
    t.string "name"
    t.integer "admin_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_user_id"], name: "index_forum_forums_on_admin_user_id"
  end

  create_table "forum_posts", force: :cascade do |t|
    t.text "content"
    t.integer "forum_subforum_id", null: false
    t.integer "user_id", null: false
    t.integer "forum_forum_id", null: false
    t.integer "forum_thread_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "parent_id"
    t.index ["forum_forum_id"], name: "index_forum_posts_on_forum_forum_id"
    t.index ["forum_subforum_id"], name: "index_forum_posts_on_forum_subforum_id"
    t.index ["forum_thread_id"], name: "index_forum_posts_on_forum_thread_id"
    t.index ["parent_id"], name: "index_forum_posts_on_parent_id"
    t.index ["user_id"], name: "index_forum_posts_on_user_id"
  end

  create_table "forum_subforums", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.integer "forum_forum_id", null: false
    t.integer "admin_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_user_id"], name: "index_forum_subforums_on_admin_user_id"
    t.index ["forum_forum_id"], name: "index_forum_subforums_on_forum_forum_id"
  end

  create_table "forum_threads", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "content", default: "", null: false
    t.integer "forum_subforum_id", null: false
    t.integer "forum_forum_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["forum_forum_id"], name: "index_forum_threads_on_forum_forum_id"
    t.index ["forum_subforum_id"], name: "index_forum_threads_on_forum_subforum_id"
    t.index ["user_id"], name: "index_forum_threads_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "forum_forums", "admin_users"
  add_foreign_key "forum_posts", "forum_forums"
  add_foreign_key "forum_posts", "forum_subforums"
  add_foreign_key "forum_posts", "forum_threads"
  add_foreign_key "forum_posts", "users"
  add_foreign_key "forum_subforums", "admin_users"
  add_foreign_key "forum_subforums", "forum_forums"
  add_foreign_key "forum_threads", "forum_forums"
  add_foreign_key "forum_threads", "forum_subforums"
  add_foreign_key "forum_threads", "users"
end
