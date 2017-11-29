module RecruitersHelper
	def all_recruiter
  	Recruiter.where(status: true).collect {|e| [e.try(:employee).try(:manual_employee_code).to_s + ' ' + e.try(:employee).try(:prefix).to_s + ' ' +e.try(:employee).try(:first_name).to_s+ ' ' + e.try(:employee).try(:middle_name).to_s + ' ' + e.try(:employee).try(:last_name).to_s, e.id]}
  end
end
