class InterviewSchedule < ActiveRecord::Base
  has_many :reporting_master
  has_many :particular_vacancy_requests
  has_many :interview_analyses
  belongs_to :employee
  belongs_to :interview_reschedule
  validates :interviewer_name, presence: true
  validates :interview_date, presence: true
  validates :interview_time, presence: true
  validates :location, presence: true
  validates :interview_type, presence: true
end
