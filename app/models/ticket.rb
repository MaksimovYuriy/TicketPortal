class Ticket < ApplicationRecord
    belongs_to :agent, optional: true
    belongs_to :tickets_queue
    belongs_to :workflow
    belongs_to :workflow_stage

    has_many :ticket_logs
end
