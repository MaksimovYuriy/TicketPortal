# frozen_string_literal: true

class TicketLog < ApplicationRecord
  belongs_to :ticket
  belongs_to :agent

  enum :action, {
    created: 0,
    assigned: 1,
    forward: 2,
    resolved: 3
  }

  validates :action, presence: true
end
