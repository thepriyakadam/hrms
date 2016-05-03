class ParticularVacancyRequest < ActiveRecord::Base
  belongs_to :vacancy_master
  belongs_to :employee
end
