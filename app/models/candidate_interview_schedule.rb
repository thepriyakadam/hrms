class CandidateInterviewSchedule < ActiveRecord::Base
  belongs_to :candidate_form
  belongs_to :interviewer
  belongs_to :interview_type_master
end
