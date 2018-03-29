class InterviewAnalysis < ActiveRecord::Base
  belongs_to :vacancy_request_history
  belongs_to :interview_evalution
  belongs_to :interview_attribute
  belongs_to :interview_decision
  belongs_to :interview_schedule
  belongs_to :interview_round
  
  

end
