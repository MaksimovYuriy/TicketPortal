# frozen_string_literal: true

class Agent < ApplicationRecord
  has_secure_password

  has_one :ticket, dependent: :nullify

  has_many :ticket_logs, dependent: :restrict_with_error
  has_many :agent_tickets_queues, dependent: :destroy
  has_many :tickets_queues, through: :agent_tickets_queues
  has_many :refresh_tokens, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end
