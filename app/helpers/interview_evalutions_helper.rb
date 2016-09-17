module InterviewEvalutionsHelper
  def all_interview_evaluation
    InterviewEvalution.all.collect { |x| [x.name, x.id] }
  end
end
