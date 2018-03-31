class VacancyRequestHistory < ActiveRecord::Base
  belongs_to :vacancy_master
  belongs_to :department
  belongs_to :employee_designation
  belongs_to :company_location
  belongs_to :degree
  belongs_to :degree_1
  belongs_to :degree_2
  belongs_to :reporting_master
  belongs_to :employee
  has_many :particular_vacancy_requests

  has_many :subordinates, class_name: 'VacancyRequestHistory',
                          foreign_key: 'degree_1_id'
  belongs_to :degree_1, class_name: 'Degree'

  has_many :indirect_subordinates, class_name: 'VacancyRequestHistory',
                                   foreign_key: 'degree_2_id'
  belongs_to :degree_2, class_name: 'Degree'

  has_many :particular_vacancy_requests, class_name: 'VacancyRequestHistory',
                          foreign_key: 'vacancy_history_id'
end
