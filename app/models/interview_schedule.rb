class InterviewSchedule < ActiveRecord::Base
  has_many :reporting_master
  has_many :particular_vacancy_requests
  has_many :interview_analyses
  has_many :interview_reschedules
  has_many :interview_rounds
  belongs_to :employee
  belongs_to :interview_reschedule
end
