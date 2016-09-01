class EmployeeAttendance < ActiveRecord::Base
  belongs_to :employee
  belongs_to :employee_leav_request

  def is_holiday?
  	 a = self.day
  	start_date = a.beginning_of_month
    end_date = a.end_of_month
    start_date.step(end_date).each do |d|
    	@holiday = Holiday.find_by(holiday_date: d)
    	@holiday.holiday_date <= d
  	end
  end
  
  private

  def self.filter_by_date_and_costcenter_and_present(day, costcenter_id,present)
    @attendances = EmployeeAttendance.where(day: day.to_date).pluck(:employee_id)
    @joining_details = JoiningDetail.where(cost_center_id: costcenter_id).pluck(:employee_id)
    @attendance_status = EmployeeAttendance.where(present: present).pluck(:employee_id)
    EmployeeAttendance.where(employee_id: @joining_details - @attendances - @attendance_status)
  end

end
