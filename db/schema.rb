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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121114174712) do

  create_table "application_form_fields", :force => true do |t|
    t.integer  "application_form_id"
    t.integer  "form_field_id"
    t.text     "field_answer"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "application_form_fields", ["application_form_id"], :name => "index_application_form_fields_on_application_form_id"
  add_index "application_form_fields", ["form_field_id"], :name => "index_application_form_fields_on_form_field_id"

  create_table "application_forms", :force => true do |t|
    t.integer  "user_id"
    t.integer  "form_id"
    t.string   "tracking_id"
    t.string   "comment"
    t.integer  "status",      :default => 1, :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "application_forms", ["form_id"], :name => "index_application_forms_on_form_id"
  add_index "application_forms", ["user_id"], :name => "index_application_forms_on_user_id"

  create_table "application_processes", :force => true do |t|
    t.integer  "application_form_id"
    t.integer  "refferer_id"
    t.integer  "reffer_to_id"
    t.string   "purpose"
    t.text     "message"
    t.integer  "status",              :default => 1
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "application_processes", ["application_form_id"], :name => "index_application_processes_on_application_form_id"
  add_index "application_processes", ["reffer_to_id"], :name => "index_application_processes_on_reffer_to_id"
  add_index "application_processes", ["refferer_id"], :name => "index_application_processes_on_refferer_id"
  add_index "application_processes", ["status"], :name => "index_application_processes_on_status"

  create_table "form_fields", :force => true do |t|
    t.integer  "form_id"
    t.string   "label"
    t.text     "description"
    t.string   "answer_type"
    t.boolean  "mandetory"
    t.text     "answer_opitons"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "form_fields", ["form_id"], :name => "index_form_fields_on_form_id"

  create_table "forms", :force => true do |t|
    t.string   "title",        :null => false
    t.string   "sub_title"
    t.text     "requirements"
    t.text     "description"
    t.text     "note"
    t.date     "last_date",    :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name",                       :null => false
    t.string   "last_name"
    t.string   "email",                            :null => false
    t.string   "official_id",                      :null => false
    t.text     "permanent_address"
    t.text     "present_addresss",                 :null => false
    t.string   "contact_number",                   :null => false
    t.integer  "role",              :default => 1, :null => false
    t.string   "salt_key",                         :null => false
    t.string   "hashed_password",                  :null => false
    t.string   "recover_hash"
    t.integer  "status",            :default => 1, :null => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

end
