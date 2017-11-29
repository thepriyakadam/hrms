class InterviewRoundReschedule < ActiveRecord::Base
  belongs_to :interview_round
  belongs_to :employee
  belongs_to :interview_type
end
