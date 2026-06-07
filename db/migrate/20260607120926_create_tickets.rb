# frozen_string_literal: true

class CreateTickets < ActiveRecord::Migration[7.1]
  def change
    create_table :tickets do |t|
      t.string :subject
      t.text :body
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
