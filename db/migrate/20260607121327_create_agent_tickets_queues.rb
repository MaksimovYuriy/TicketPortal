# frozen_string_literal: true

class CreateAgentTicketsQueues < ActiveRecord::Migration[7.1]
  def change
    create_table :agent_tickets_queues do |t|
      t.references :agent, null: false, foreign_key: true
      t.references :tickets_queue, null: false, foreign_key: true

      t.timestamps
    end
  end
end
