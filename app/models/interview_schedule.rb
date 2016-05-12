class InterviewSchedule < ActiveRecord::Base
  has_many :reporting_master
  belongs_to :employee
  belongs_to :interview_reschedule
  validates :interviewer_name, presence: true
  validates :interview_date, presence: true
  validates :interview_time, presence: true
  validates :location, presence: true
  validates :interview_type, presence: true
end
