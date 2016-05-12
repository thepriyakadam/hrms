class TrainingRequest < ActiveRecord::Base
  belongs_to :employee
  belongs_to :reporting_master
end
