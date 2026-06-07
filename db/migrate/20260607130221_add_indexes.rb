# frozen_string_literal: true

class AddIndexes < ActiveRecord::Migration[7.1]
  def change
    add_index :agents, :email, unique: true
    add_index :workflow_stages, %i[workflow_id position], unique: true
    add_index :tickets_queues, :label, unique: true
    add_index :agent_tickets_queues, %i[agent_id tickets_queue_id], unique: true
    add_index :workflows, :name, unique: true
  end
end
