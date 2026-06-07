class WorkflowStage < ApplicationRecord
  belongs_to :workflow
  belongs_to :tickets_queue
  
  has_many :tickets
end
