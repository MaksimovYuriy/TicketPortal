class TicketsQueue < ApplicationRecord
  has_many :tickets
  has_many :agent_tickets_queues
  has_many :agents, through: :agent_tickets_queues
  has_many :workflow_stages
end
