module TrainingRequestsHelper
	def all_training_topic
		TrainingTopicMaster.all.collect { |t| [t.name, t.id] }
	end
end
