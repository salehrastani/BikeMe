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

ActiveRecord::Schema.define(version: 20150910185503) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drivers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "phone_number"
    t.string   "image"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "token"
    t.string   "stripe_token"
    t.integer  "cancellation"
  end

  create_table "locations", force: :cascade do |t|
    t.decimal  "lat",            precision: 10, scale: 6
    t.decimal  "lng",            precision: 10, scale: 6
    t.integer  "locatable_id"
    t.string   "locatable_type"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "passengers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "phone_number"
    t.string   "image"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "token"
    t.string   "stripe_token"
    t.integer  "cancellation"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "stars"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "ratable_id"
    t.string   "ratable_type"
  end

  create_table "trips", force: :cascade do |t|
    t.string   "origin"
    t.string   "destination"
    t.string   "duration"
    t.integer  "price"
    t.integer  "driver_id"
    t.integer  "passenger_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.boolean  "complete"
  end

  create_table "vehicles", force: :cascade do |t|
    t.integer  "driver_id"
    t.string   "make"
    t.string   "model"
    t.string   "year"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
