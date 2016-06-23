class TrainingRequest < ActiveRecord::Base
  belongs_to :employee
  belongs_to :reporting_master
  belongs_to :training_topic_master
  has_many :training_plans
end
