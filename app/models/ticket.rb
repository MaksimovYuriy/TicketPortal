# frozen_string_literal: true

class Ticket < ApplicationRecord
  belongs_to :agent, optional: true
  belongs_to :tickets_queue, optional: true
  belongs_to :workflow, optional: true
  belongs_to :workflow_stage, optional: true

  has_many :ticket_logs, dependent: :destroy

  enum :status, {
    in_queue: 0,
    in_progress: 1,
    resolved: 2
  }

  validates :subject, presence: true, length: { maximum: 200 }
  validates :body, presence: true
  validates :status, presence: true
end
