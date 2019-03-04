class PremierReportsController < ApplicationController
	def attendances
		@day = "2019-02-18"
		@employees = Employee.all
	end

	def employee_wise_attendance
    params = {employee_id: 1, year: 2019, month: "February"}
    @employee = Employee.find_by_id(params[:employee_id])
    @month = params[:month]
    @year = params[:year]

    @date = Date.new(@year.to_i, Workingday.months[@month])
    @day = @date.end_of_month.day
    @start_date = @date
    @end_date = @date.end_of_month
	end

  def late_comming_report
    params = {start_date: "2019-02-18", end_date: "2019-02-22"}
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @late_commings = DailyAttendance.range(@start_date, @end_date)
  end

  def workman_register
    params = {year: 2019, employee_id: 1}
    @employee = Employee.find_by_id(params[:employee_id])
    @year = params[:year]
    @date = Date.new(@year.to_i)
    @months = Workingday.months
  end

  def shift_error_report
    params = {start_date: "2019-02-18", end_date: "2019-02-22"}
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @shift_errors = DailyAttendance.range(@start_date, @end_date)
  end
end