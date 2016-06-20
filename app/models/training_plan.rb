class TrainingPlan < ActiveRecord::Base
	belongs_to :training_request
	belongs_to :training_topic_master

	 validates :training_topic_master_id, presence: true
end
