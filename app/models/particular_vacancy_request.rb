class ParticularVacancyRequest < ActiveRecord::Base
  belongs_to :vacancy_master
  belongs_to :employee
  belongs_to :interview_schedule
  belongs_to :selected_resume
  belongs_to :vacancy_request_history
  has_many :subordinates, class_name: 'ParticularVacancyRequest',
                          foreign_key: 'vacancy_history_id'
  belongs_to :vacancy_history, class_name: 'VacancyRequestHistory'
end
