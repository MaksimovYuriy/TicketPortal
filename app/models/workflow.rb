class Workflow < ApplicationRecord
  has_many :tickets
  has_many :workflow_stages

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
