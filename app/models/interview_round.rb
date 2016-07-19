class InterviewRound < ActiveRecord::Base
  belongs_to :interview_schedule
  belongs_to :employee
  belongs_to :interview_type
  has_many :interview_analyses
  has_many :interview_round_reschedules
end
