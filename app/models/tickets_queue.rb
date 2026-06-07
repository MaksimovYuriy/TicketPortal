# frozen_string_literal: true

class TicketsQueue < ApplicationRecord
  has_many :tickets, dependent: :nullify
  has_many :agent_tickets_queues, dependent: :destroy
  has_many :agents, through: :agent_tickets_queues
  has_many :workflow_stages, dependent: :nullify

  validates :label, presence: true, length: { maximum: 100 }
  validates :order_value, presence: true
end
