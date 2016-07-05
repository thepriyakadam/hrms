require 'query_report/helper'  # need to require the helper
class ParticularLeaveRecordsController < ApplicationController
  load_and_authorize_resource only: [:show_leave_record]
  include QueryReport::Helper  # need to include it
  def show_leave_record
    @employee_leave_request = EmployeeLeavRequest.find(params[:format])
    @particular_leave_records = @employee_leave_request.particular_leave_records
  end

   def search_by_leave_date
    reporter(@particular_leave_records, template_class: PdfReportTemplate) do
      # filter :leave_date, type: :date
      column(:ID, sortable: true) { |particular_leave_record| particular_leave_record.employee.try(:manual_employee_code) }
      column(:Employee_Name, sortable: true) { |particular_leave_record| full_name(particular_leave_record.employee) }
      column(:Designation, sortable: true) { |particular_leave_record| particular_leave_record.employee.joining_detail.employee_designation.name }
      column(:TO, sortable: true) { |particular_leave_record| particular_leave_record.leave_date }
     
    end
  end

end
