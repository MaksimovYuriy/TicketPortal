class AgentTicketsQueue < ApplicationRecord
  belongs_to :agent
  belongs_to :tickets_queue

  validates :agent_id, uniqueness: { scope: :tickets_queue_id }
end
