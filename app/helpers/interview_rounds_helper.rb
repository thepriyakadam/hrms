module InterviewRoundsHelper
  
  def all_interviewer_name_list
    ReportingMaster.all.collect { |e| [e.try(:employee).try(:manual_employee_code).try(:to_s) + ' ' + e.try(:employee).try(:first_name).try(:to_s) + ' ' + e.try(:employee).try(:last_name).try(:to_s), e.try(:employee).id] }
  end

  def all_interview_type
    InterviewType.all.collect { |x| [x.name, x.id] }
  end

end
