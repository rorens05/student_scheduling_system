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

ActiveRecord::Schema.define(version: 2019_03_29_042257) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "curriculums", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "evaluations", force: :cascade do |t|
    t.bigint "grade_id"
    t.bigint "curriculum_id"
    t.string "school_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["curriculum_id"], name: "index_evaluations_on_curriculum_id"
    t.index ["grade_id"], name: "index_evaluations_on_grade_id"
  end

  create_table "grades", force: :cascade do |t|
    t.string "grade"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instructors", force: :cascade do |t|
    t.string "name"
    t.string "instructor_id"
    t.date "birthday"
    t.string "address"
    t.string "contact_no"
    t.string "email"
    t.date "date_enrolled"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sections", force: :cascade do |t|
    t.string "name"
    t.integer "school_year"
    t.bigint "grade_id"
    t.bigint "curriculum_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "room"
    t.index ["curriculum_id"], name: "index_sections_on_curriculum_id"
    t.index ["grade_id"], name: "index_sections_on_grade_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "student_no"
    t.date "birthday"
    t.string "address"
    t.string "contact_no"
    t.string "email"
    t.date "date_enrolled"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "grade_id"
    t.string "school_year"
    t.decimal "average"
    t.integer "curriculum_id"
    t.integer "section_id"
  end

  create_table "subject_classes", force: :cascade do |t|
    t.string "schedule"
    t.string "subject"
    t.string "day"
    t.integer "minutes_per_week"
    t.string "subject_teacher"
    t.bigint "section_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["section_id"], name: "index_subject_classes_on_section_id"
  end

  add_foreign_key "evaluations", "curriculums"
  add_foreign_key "evaluations", "grades"
  add_foreign_key "sections", "curriculums"
  add_foreign_key "sections", "grades"
  add_foreign_key "subject_classes", "sections"
end
