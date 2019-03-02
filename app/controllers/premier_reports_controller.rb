class PremierReportsController < ApplicationController
	def attendances
		@day = "2019-02-18"
		@employees = Employee.all
	end

	def employee_wise_attendance
		@day = "2019-02-18"
		@employees = Employee.all
	end
end
