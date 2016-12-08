require 'query_report/helper'  # need to require the helper
class ParticularLeaveRecordsController < ApplicationController
  load_and_authorize_resource only: [:show_leave_record]
  include QueryReport::Helper  # need to include it
  def show_leave_record
    @employee_leave_request = EmployeeLeavRequest.find(params[:format])
    @particular_leave_records = @employee_leave_request.particular_leave_records
  end

  def search_by_leave_date
    reporter(ParticularLeaveRecord.filter_records(current_user), template_class: PdfReportTemplate) do
      filter :leave_date, type: :date
      # filter :is_cancel_after_approve, type: :boolean
      #column :leave_request_id, sortable: true, &:employee_leav_request_id
      column(:Employee_ID, sortable: true) { |particular_leave_record| particular_leave_record.employee.try(:manual_employee_code) }
      column(:Employee_Name, sortable: true) { |particular_leave_record| full_name(particular_leave_record.employee) }
      column(:Designation, sortable: true) { |particular_leave_record| particular_leave_record.employee.joining_detail.try(:employee_designation).try(:name) }
      column(:Leave_date, sortable: true) { |particular_leave_record| particular_leave_record.leave_date.to_date }
      column(:Leave_Type, sortable: true){ |particular_leave_record| particular_leave_record.employee_leav_request.leave_type }
      column(:Leave_Category, sortable: true) { |particular_leave_record| particular_leave_record.leav_category.try(:description) }
      column(:Approved_date, sortable: true) { |particular_leave_record| particular_leave_record.created_at.to_date }
      column(:Approved_Time, sortable: true) { |particular_leave_record| particular_leave_record.created_at }
      column :Revert_Leave, sortable: true, &:is_cancel_after_approve
       
      session[:active_tab] ="LeaveManagement"
      session[:active_tab1] ="LeaveReports"
    #   chart(:pie, 'Leave') do |chart|
    #   chart.sum_with 'Taken' => :leave_date, 'Revert' => :employee_leav_request_id
    # end
    
  end
 end
end

