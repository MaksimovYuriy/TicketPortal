class TicketLog < ApplicationRecord
  belongs_to :ticket
  belongs_to :agent
end
