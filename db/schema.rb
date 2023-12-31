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

ActiveRecord::Schema[7.0].define(version: 2023_10_16_200705) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "company"
    t.string "cnpj"
    t.string "phone_number"
    t.string "email"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "voucher_singu"
    t.boolean "assinatura_singu"
    t.boolean "corporativo_singu"
    t.boolean "residencial_singu"
    t.boolean "eventos_singu"
    t.boolean "dia_especial_singu"
  end

  create_table "contacts_solutions", id: false, force: :cascade do |t|
    t.bigint "contact_id", null: false
    t.bigint "solution_id", null: false
  end

  create_table "solutions", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "step_1"
    t.text "step_2"
    t.text "step_3"
    t.text "step_4"
    t.string "image"
  end

end
