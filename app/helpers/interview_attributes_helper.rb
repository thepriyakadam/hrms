module InterviewAttributesHelper
  def all_interview_attribute
    InterviewAttribute.all.collect { |x| [x.name, x.id] }
  end
end
