class ParticularLeaveRecordsController < ApplicationController
  def show_leave_record
    @employee_leave_request = EmployeeLeavRequest.find(params[:format])
    @particular_leave_records = @employee_leave_request.particular_leave_records
  end
end
