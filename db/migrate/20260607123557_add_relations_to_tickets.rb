# frozen_string_literal: true

class AddRelationsToTickets < ActiveRecord::Migration[7.1]
  def change
    add_reference :tickets, :agent, foreign_key: true, index: { unique: true }
    add_reference :tickets, :tickets_queue, foreign_key: true
    add_reference :tickets, :workflow, foreign_key: true
    add_reference :tickets, :workflow_stage, foreign_key: true
  end
end
