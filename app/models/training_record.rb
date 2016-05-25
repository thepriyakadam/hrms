class TrainingRecord < ActiveRecord::Base
  belongs_to :employee
  belongs_to :training_topic_master
end
