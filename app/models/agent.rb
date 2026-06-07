# frozen_string_literal: true

class Agent < ApplicationRecord
  has_one :ticket, dependent: :nullify

  has_many :ticket_logs, dependent: :restrict_with_error
  has_many :agent_tickets_queues, dependent: :destroy
  has_many :tickets_queues, through: :agent_tickets_queues

  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true
  validates :name, presence: true
end
