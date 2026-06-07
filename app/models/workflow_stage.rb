# frozen_string_literal: true

class WorkflowStage < ApplicationRecord
  belongs_to :workflow
  belongs_to :tickets_queue

  has_many :tickets, dependent: :nullify

  validates :position, presence: true, uniqueness: { scope: :workflow_id }, numericality: { only_integer: true }
end
