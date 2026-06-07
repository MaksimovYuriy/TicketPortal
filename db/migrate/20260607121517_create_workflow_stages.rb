# frozen_string_literal: true

class CreateWorkflowStages < ActiveRecord::Migration[7.1]
  def change
    create_table :workflow_stages do |t|
      t.integer :position
      t.references :workflow, null: false, foreign_key: true
      t.references :tickets_queue, null: false, foreign_key: true

      t.timestamps
    end
  end
end
