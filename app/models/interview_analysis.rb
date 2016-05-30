class InterviewAnalysis < ActiveRecord::Base
  belongs_to :vacancy_request_history
  belongs_to :interview_evalution
  belongs_to :interview_attribute
  belongs_to :interview_decision
  belongs_to :interview_schedule
  
  validates :interview_evalution_id, presence: true
  validates :interview_attribute_id, presence: true
  validates :interview_decision_id, presence: true
  validates :comment, presence: true

end
