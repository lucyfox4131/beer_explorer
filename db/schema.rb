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

ActiveRecord::Schema.define(version: 20160803212307) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "rated_beers", force: :cascade do |t|
    t.string   "api_id"
    t.string   "name"
    t.string   "style_id"
    t.integer  "rated_brewery_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["rated_brewery_id"], name: "index_rated_beers_on_rated_brewery_id", using: :btree
  end

  create_table "rated_breweries", force: :cascade do |t|
    t.string   "api_id"
    t.string   "name"
    t.string   "image"
    t.string   "postal_code"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "recommendations", force: :cascade do |t|
    t.string   "name"
    t.string   "api_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_rated_beers", force: :cascade do |t|
    t.integer  "rating"
    t.integer  "user_id"
    t.integer  "rated_beer_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["rated_beer_id"], name: "index_user_rated_beers_on_rated_beer_id", using: :btree
    t.index ["user_id"], name: "index_user_rated_beers_on_user_id", using: :btree
  end

  create_table "user_recommendations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "recommendation_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["recommendation_id"], name: "index_user_recommendations_on_recommendation_id", using: :btree
    t.index ["user_id"], name: "index_user_recommendations_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_foreign_key "rated_beers", "rated_breweries"
  add_foreign_key "user_rated_beers", "rated_beers"
  add_foreign_key "user_rated_beers", "users"
end
