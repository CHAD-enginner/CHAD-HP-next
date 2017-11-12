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

ActiveRecord::Schema.define(version: 20171112042742) do

  create_table "accounts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint   "graph_id",                                            null: false
    t.string   "name",                                                null: false
    t.string   "first_name",                                          null: false
    t.string   "last_name",                                           null: false
    t.integer  "gender",                                              null: false
    t.string   "email",                                               null: false
    t.string   "locale",                            default: "js_JP", null: false
    t.float    "timezone",            limit: 24,                      null: false
    t.string   "profile_page_url",                                    null: false
    t.text     "profile_picture_url", limit: 65535,                   null: false
    t.integer  "age_range_min",       limit: 2,                       null: false
    t.text     "access_token",        limit: 65535,                   null: false
    t.datetime "token_expire",                                        null: false
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  create_table "adkiseis", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.string   "text",       null: false
    t.string   "backimage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "joining"
    t.string   "graduating"
  end

  create_table "adminusers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.integer  "failed_attempts",        default: 0,  null: false
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_adminusers_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_adminusers_on_reset_password_token", unique: true, using: :btree
  end

  create_table "adusers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "university"
    t.string   "studentnumber"
    t.string   "role"
    t.string   "email"
    t.string   "adress"
    t.string   "phone"
    t.string   "avator"
    t.integer  "adkisei_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "account_id",                 comment: "accountのid"
    t.index ["account_id"], name: "index_adusers_on_account_id", using: :btree
    t.index ["adkisei_id"], name: "index_adusers_on_adkisei_id", using: :btree
    t.index ["name"], name: "index_adusers_on_name", using: :btree
  end

  create_table "contacts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.string   "email",      null: false
    t.string   "university"
    t.string   "grade"
    t.string   "text",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kiseis", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.string   "text",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "backimage"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "adress"
    t.string   "phone"
    t.string   "avator"
    t.integer  "kisei_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "role"
    t.index ["kisei_id"], name: "index_users_on_kisei_id", using: :btree
  end

  add_foreign_key "adusers", "accounts"
end
