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

  def leave_approval_report
  end

  def show_approved_record
    @start_date = params[:employee][:start_date]
    @end_date = params[:employee][:end_date]
    @company_id = params[:employee][:company_id]
    @location = params[:employee][:company_location_id]
    @department = params[:employee][:department_id]
  
    if current_user.class == Group
      if @company_id == ""
        @particular_leave_records = ParticularLeaveRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime)
      elsif @location == ""
        @employees = Employee.where(company_id: @company_id.to_i).pluck(:id)
        @particular_leave_records = ParticularLeaveRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
      elsif @department == ""
        @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
        @particular_leave_records = ParticularLeaveRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
      else
        @employees = Employee.where(company_id: @company_id.to_i,company_location_id: @location.to_i,department_id: @department.to_i).pluck(:id)
        @particular_leave_records = ParticularLeaveRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
      end
      
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @company_id == ""
          @particular_leave_records = ParticularLeaveRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime)
        elsif @location == ""
          @employees = Employee.where(company_id: @company_id.to_i).pluck(:id)
          @particular_leave_records = ParticularLeaveRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        elsif @department == ""
          @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
          @particular_leave_records = ParticularLeaveRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company_id.to_i,company_location_id: @location.to_i,department_id: @department.to_i).pluck(:id)
          @particular_leave_records = ParticularLeaveRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Admin'
        if @company_id == ""
          @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
          @particular_leave_records = ParticularLeaveRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        elsif @location == ""
          @employees = Employee.where(company_id: @company_id.to_i).pluck(:id)
          @particular_leave_records = ParticularLeaveRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        elsif @department == ""
          @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
          @particular_leave_records = ParticularLeaveRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company_id.to_i,company_location_id: @location.to_i,department_id: @department.to_i).pluck(:id)
          @particular_leave_records = ParticularLeaveRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Branch'
        if @company_id == "" || @location == ""
          @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
          @particular_leave_records = ParticularLeaveRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        elsif @department == ""
          @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
          @particular_leave_records = ParticularLeaveRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company_id.to_i,company_location_id: @location.to_i,department_id: @department.to_i).pluck(:id)
          @particular_leave_records = ParticularLeaveRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'HOD'
        if @company_id == "" || @location == "" || @department == ""
          @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
          @particular_leave_records = ParticularLeaveRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company_id.to_i,company_location_id: @location.to_i,department_id: @department.to_i).pluck(:id)
          @particular_leave_records = ParticularLeaveRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        end
      end
    end

    respond_to do |f|
      f.js
      f.xls {render template: 'particular_leave_records/approved_record.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'show_approved_record',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'particular_leave_records/approved_record.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
  end
  
end