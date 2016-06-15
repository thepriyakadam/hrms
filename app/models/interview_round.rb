class InterviewRound < ActiveRecord::Base
  belongs_to :interview_schedule
  belongs_to :employee
  belongs_to :interview_type
end
