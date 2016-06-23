module EmployeeDailyActivitiesHelper

	def project_master
    ProjectMaster.all.collect { |x| [x.name, x.id] }
  end

end
