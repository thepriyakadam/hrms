class ReportingMastersVacancyMaster < ActiveRecord::Base
   
   belongs_to :vacancy_master
   belongs_to :reporting_master

end
