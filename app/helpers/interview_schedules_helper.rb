module InterviewSchedulesHelper
  def all_candidate_name2
      InterviewSchedule.where(is_confirm: true).collect { |x| [x.candidate_name] }
  end
end
