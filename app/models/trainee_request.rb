class TraineeRequest < ActiveRecord::Base
  belongs_to :training_request
  belongs_to :employee
  belongs_to :training_topic_master
 
end
