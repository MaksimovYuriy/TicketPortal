# frozen_string_literal: true

class CreateTicketLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :ticket_logs do |t|
      t.integer :action, null: false
      t.references :ticket, null: false, foreign_key: true
      t.references :agent, null: false, foreign_key: true

      t.timestamps
    end
  end
end
