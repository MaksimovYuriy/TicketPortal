class Agent < ApplicationRecord
  has_one :ticket

  has_many :ticket_logs
  has_many :agent_tickets_queues
  has_many :tickets_queues, through: :agent_tickets_queues
end
