module InterviewSchedulesHelper
  def all_interviewer_name_list
    ReportingMaster.all.collect { |e| [e.try(:employee).try(:manual_employee_code).try(:to_s) + ' ' + e.try(:employee).try(:first_name).try(:to_s) + ' ' + e.try(:employee).try(:last_name).try(:to_s), e.try(:employee).id] }
  end

  def all_candidate_name
      SelectedResume.where(is_confirm: true).collect { |x| [x.name] }
  end

end
