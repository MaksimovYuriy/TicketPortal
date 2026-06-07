# frozen_string_literal: true

class Workflow < ApplicationRecord
  has_many :tickets, dependent: :nullify
  has_many :workflow_stages, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
