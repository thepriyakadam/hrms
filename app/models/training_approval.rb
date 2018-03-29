class TrainingApproval < ActiveRecord::Base
  belongs_to :training_request
  belongs_to :employee
  belongs_to :training_topic_master
  belongs_to :reporting_master
end
