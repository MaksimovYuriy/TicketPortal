class Ticket < ApplicationRecord
    belongs_to :agent, optional: true
    belongs_to :tickets_queue
    belongs_to :workflow
    belongs_to :workflow_stage

    has_many :ticket_logs

    enum status: {
        in_queue: 0,
        in_progress: 1,
        resolved: 2
    }

    validates :subject, presence: true, length: { maximum: 200 }
    validates :body, presence: true
    validates :status, presence: true
end
