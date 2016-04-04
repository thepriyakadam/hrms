class InterviewSchedule < ActiveRecord::Base
  validates :interviewer_name, :presence => true
  validates :candidate_name, :presence => true
  validates :interview_date, :presence => true
  validates :interview_time, :presence => true
  validates :location, :presence => true
  validates :interview_type, :presence => true
end
