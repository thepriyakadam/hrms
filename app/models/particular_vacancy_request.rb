class ParticularVacancyRequest < ActiveRecord::Base
  belongs_to :vacancy_master
  belongs_to :employee
  belongs_to :interview_schedule
  belongs_to :selected_resume
  belongs_to :vacancy_request_history,class_name: "VacancyRequestHistory"
  
end
