class InterviewReschedule < ActiveRecord::Base
  belongs_to :interview_schedule
  belongs_to :employee

  validates :interview_date, presence: true
  validates :interview_time, presence: true
end
