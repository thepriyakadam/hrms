module InterviewAnalysesHelper
   
  def all_interview_evaluation
    InterviewEvalution.all.collect { |x| [x.name, x.id] }
  end

  def all_interview_attribute
    InterviewAttribute.all.collect { |x| [x.name, x.id] }
  end

  def all_interview_decision
    InterviewDecision.all.collect { |x| [x.name, x.id] }
  end

end
