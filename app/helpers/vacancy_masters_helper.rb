module VacancyMastersHelper
 def all_job_title
    VacancyMaster.all.collect { |x| [x.vacancy_name, x.id] }
 end
end
