module InterviewDecisionsHelper
  def all_interview_decision
    InterviewDecision.all.collect { |x| [x.name, x.id] }
  end
end
