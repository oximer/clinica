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

ActiveRecord::Schema.define(version: 20130805222454) do

  create_table "consultations", force: true do |t|
    t.integer  "treatment_id"
    t.datetime "date"
    t.text     "description"
    t.boolean  "canceled"
    t.text     "canceled_reason"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "indicateds", force: true do |t|
    t.integer  "pacient_id"
    t.integer  "indication_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "indications", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "insurances", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "insureds", force: true do |t|
    t.integer  "pacient_id"
    t.integer  "insurance_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pacients", force: true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "email"
    t.string   "rg"
    t.integer  "cpf"
    t.datetime "birthday"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payers", force: true do |t|
    t.integer  "payment_id"
    t.integer  "treatment_id"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "procedures", force: true do |t|
    t.integer  "proceduretype_id"
    t.integer  "insurance_id"
    t.string   "name"
    t.text     "description"
    t.float    "value"
    t.integer  "followup"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proceduretypes", force: true do |t|
    t.string   "name"
    t.integer  "followup"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "telephones", force: true do |t|
    t.integer  "pacient_id"
    t.integer  "ddd"
    t.integer  "number"
    t.boolean  "preferred"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "treatments", force: true do |t|
    t.integer  "pacient_id"
    t.integer  "procedure_id"
    t.float    "discount"
    t.boolean  "done"
    t.string   "tooth"
    t.string   "face"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
