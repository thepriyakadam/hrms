module InterviewTypeMastersHelper
	
	def all_interview_type_master
    InterviewTypeMaster.all.collect { |x| [x.name, x.id] }
  end
end
