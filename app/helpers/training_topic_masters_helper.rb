module TrainingTopicMastersHelper
  def all_training_course
    TrainingTopicMaster.all.collect { |s| [s.name, s.id] }
  end

  def all_training_topic
		TrainingTopicMaster.all.collect { |t| [t.name, t.id] }
	end
end
