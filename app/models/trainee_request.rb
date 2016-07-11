class TraineeRequest < ActiveRecord::Base
  belongs_to :training_request
  belongs_to :employee
end
