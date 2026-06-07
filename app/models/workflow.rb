class Workflow < ApplicationRecord
  has_many :tickets
  has_many :workflow_stages
end
