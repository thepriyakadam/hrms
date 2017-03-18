module VacancyMastersHelper
 def all_job_title
    VacancyMaster.all.collect { |x| [x.vacancy_name, x.id] }
 end

 def all_vacancy_name
 	# byebug
    # VacancyMaster.where(current_status: "FinalApproved").collect { |x| [x.try(:vacancy_code) +' '+ x.try(:vacancy_name),x.id] }
    VacancyMaster.where(current_status: "FinalApproved",is_confirmed: nil).collect { |x| [x.try(:vacancy_name),x.id] }
 end
end
