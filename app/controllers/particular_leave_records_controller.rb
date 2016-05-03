class ParticularLeaveRecordsController < ApplicationController
  load_and_authorize_resource only: [:show_leave_record]
  def show_leave_record
    @employee_leave_request = EmployeeLeavRequest.find(params[:format])
    @particular_leave_records = @employee_leave_request.particular_leave_records
  end
end
