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

ActiveRecord::Schema[7.1].define(version: 2026_06_07_130221) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agent_tickets_queues", force: :cascade do |t|
    t.bigint "agent_id", null: false
    t.bigint "tickets_queue_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id", "tickets_queue_id"], name: "index_agent_tickets_queues_on_agent_id_and_tickets_queue_id", unique: true
    t.index ["agent_id"], name: "index_agent_tickets_queues_on_agent_id"
    t.index ["tickets_queue_id"], name: "index_agent_tickets_queues_on_tickets_queue_id"
  end

  create_table "agents", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_agents_on_email", unique: true
  end

  create_table "ticket_logs", force: :cascade do |t|
    t.integer "action", null: false
    t.bigint "ticket_id", null: false
    t.bigint "agent_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_ticket_logs_on_agent_id"
    t.index ["ticket_id"], name: "index_ticket_logs_on_ticket_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "subject"
    t.text "body"
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "agent_id"
    t.bigint "tickets_queue_id", null: false
    t.bigint "workflow_id", null: false
    t.bigint "workflow_stage_id", null: false
    t.index ["agent_id"], name: "index_tickets_on_agent_id", unique: true
    t.index ["tickets_queue_id"], name: "index_tickets_on_tickets_queue_id"
    t.index ["workflow_id"], name: "index_tickets_on_workflow_id"
    t.index ["workflow_stage_id"], name: "index_tickets_on_workflow_stage_id"
  end

  create_table "tickets_queues", force: :cascade do |t|
    t.string "label"
    t.integer "order_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["label"], name: "index_tickets_queues_on_label", unique: true
  end

  create_table "workflow_stages", force: :cascade do |t|
    t.integer "position"
    t.bigint "workflow_id", null: false
    t.bigint "tickets_queue_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tickets_queue_id"], name: "index_workflow_stages_on_tickets_queue_id"
    t.index ["workflow_id", "position"], name: "index_workflow_stages_on_workflow_id_and_position", unique: true
    t.index ["workflow_id"], name: "index_workflow_stages_on_workflow_id"
  end

  create_table "workflows", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "agent_tickets_queues", "agents"
  add_foreign_key "agent_tickets_queues", "tickets_queues"
  add_foreign_key "ticket_logs", "agents"
  add_foreign_key "ticket_logs", "tickets"
  add_foreign_key "tickets", "agents"
  add_foreign_key "tickets", "tickets_queues"
  add_foreign_key "tickets", "workflow_stages"
  add_foreign_key "tickets", "workflows"
  add_foreign_key "workflow_stages", "tickets_queues"
  add_foreign_key "workflow_stages", "workflows"
end
