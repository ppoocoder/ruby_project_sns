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

ActiveRecord::Schema.define(version: 20170818090325) do

  create_table "blog_posts", force: :cascade do |t|
    t.text     "title"
    t.text     "b_description"
    t.text     "content"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "pin_id"
    t.integer  "recipe_blog_id"
    t.text     "content"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "directions", force: :cascade do |t|
    t.integer  "step"
    t.text     "cooking_recipe"
    t.string   "blogs_cooking_pic"
    t.integer  "recipe_blog_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["recipe_blog_id"], name: "index_directions_on_recipe_blog_id"
  end

  create_table "follows", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["followed_id"], name: "index_follows_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_follows_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_follows_on_follower_id"
  end

  create_table "ingrediants", force: :cascade do |t|
    t.string   "name"
    t.integer  "recipe_blog_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["recipe_blog_id"], name: "index_ingrediants_on_recipe_blog_id"
  end

  create_table "ingrediants_tags", id: false, force: :cascade do |t|
    t.integer "ingrediant_id"
    t.integer "tag_id"
    t.index ["ingrediant_id"], name: "index_ingrediants_tags_on_ingrediant_id"
    t.index ["tag_id"], name: "index_ingrediants_tags_on_tag_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "pin_id"
    t.integer  "recipe_blog_id"
    t.integer  "blog_post_id"
    t.integer  "likes_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "pins", force: :cascade do |t|
    t.string   "country"
    t.string   "country_code"
    t.text     "p_description"
    t.integer  "task"
    t.integer  "user_id"
    t.integer  "likes_count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pin_image"
  end

  create_table "pins_tags", id: false, force: :cascade do |t|
    t.integer "pin_id"
    t.integer "tag_id"
    t.index ["pin_id"], name: "index_pins_tags_on_pin_id"
    t.index ["tag_id"], name: "index_pins_tags_on_tag_id"
  end

  create_table "recipe_blogs", force: :cascade do |t|
    t.string   "title"
    t.string   "country"
    t.text     "r_description"
    t.integer  "likes_count"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "blogs_main_pic"
    t.string   "blogs_dish_pic"
  end

  create_table "recipe_blogs_tags", id: false, force: :cascade do |t|
    t.integer "recipe_blog_id"
    t.integer "tag_id"
    t.index ["recipe_blog_id"], name: "index_recipe_blogs_tags_on_recipe_blog_id"
    t.index ["tag_id"], name: "index_recipe_blogs_tags_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tinymce_images", force: :cascade do |t|
    t.string   "alt"
    t.string   "hint"
    t.string   "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trivia_knows", force: :cascade do |t|
    t.text     "title"
    t.text     "content"
    t.integer  "recipe_blog_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["recipe_blog_id"], name: "index_trivia_knows_on_recipe_blog_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "username"
    t.string   "male"
    t.string   "country"
    t.string   "country_code"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
