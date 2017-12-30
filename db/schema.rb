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

ActiveRecord::Schema.define(version: 20171230050934) do

  create_table "engineers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.text     "profile",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["user_id"], name: "index_engineers_on_user_id", using: :btree
  end

  create_table "idea_comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "idea_id"
    t.text     "content",      limit: 65535
    t.integer  "comment_type", limit: 1,     default: 0, null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["idea_id"], name: "index_idea_comments_on_idea_id", using: :btree
  end

  create_table "ideas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "user_id"
    t.text     "about",      limit: 65535
    t.integer  "status",     limit: 1,     default: 0, null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["user_id"], name: "index_ideas_on_user_id", using: :btree
  end

  create_table "project_comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "project_room_id"
    t.text     "content",         limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["project_room_id"], name: "index_project_comments_on_project_room_id", using: :btree
  end

  create_table "project_rooms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "idea_id"
    t.integer  "engineer_id"
    t.date     "deadline"
    t.text     "about",       limit: 65535
    t.integer  "status",      limit: 1,     default: 0, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["engineer_id"], name: "index_project_rooms_on_engineer_id", using: :btree
    t.index ["idea_id"], name: "index_project_rooms_on_idea_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "regtype",         limit: 1, default: 0, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_foreign_key "engineers", "users"
  add_foreign_key "idea_comments", "ideas"
  add_foreign_key "ideas", "users"
  add_foreign_key "project_comments", "project_rooms"
  add_foreign_key "project_rooms", "engineers"
  add_foreign_key "project_rooms", "ideas"
end
