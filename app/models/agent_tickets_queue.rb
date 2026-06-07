class AgentTicketsQueue < ApplicationRecord
  belongs_to :agent
  belongs_to :tickets_queue
end
