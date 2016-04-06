class InterviewReschedule < ActiveRecord::Base
  
  has_many :interview_schedules
  belongs_to :employee

  validates :interview_date, :presence => true
  validates :interview_time, :presence => true
  
end
