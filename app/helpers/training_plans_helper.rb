module TrainingPlansHelper

  def all_training_course
    TrainingTopicMaster.all.collect { |s| [s.name, s.id] }
  end

end
