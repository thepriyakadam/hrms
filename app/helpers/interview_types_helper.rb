module InterviewTypesHelper
  def all_interview_type
    InterviewType.all.collect { |x| [x.name, x.id] }
  end
end
