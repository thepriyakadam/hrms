require 'query_report/helper' # need to require the helper

class LeaveCOffsController < ApplicationController
  before_action :set_leave_c_off, only: [:show, :edit, :update, :destroy]

  # GET /leave_c_offs
  # GET /leave_c_offs.json
  include QueryReport::Helper # need to include it

  def index
  end

  # GET /leave_c_offs/1
  # GET /leave_c_offs/1.json
  def show
  end

  # GET /leave_c_offs/new
  def new
    @leave_c_off = LeaveCOff.new
    if current_user.class == Group
      @leave_c_offs = LeaveCOff.all
    else
      if current_user.role.name == 'Company'
        @leave_c_offs = LeaveCOff.all
      elsif current_user.role.name == 'CompanyLocation'
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        @leave_c_offs = LeaveCOff.where(employee_id: @employees)
      end
    end
    session[:active_tab] ="leave"
  end

  # GET /leave_c_offs/1/edit
  def edit
  end

  # POST /leave_c_offs
  # POST /leave_c_offs.json
  def create
    @leave_c_off = LeaveCOff.new(leave_c_off_params)
    @leave_c_offs = LeaveCOff.all
    leav_category = LeavCategory.find_by_name('C.Off')
    @leave_c_off.expiry_date = @leave_c_off.c_off_date + @leave_c_off.c_off_expire_day
    if leav_category.nil?
    else
      is_exist = EmployeeLeavBalance.exists?(employee_id: @leave_c_off.employee_id, leav_category_id: leav_category.id)
      if is_exist
        @employee_leave_balance = EmployeeLeavBalance.where(employee_id: @leave_c_off.employee_id, leav_category_id: leav_category.id).take

        if @leave_c_off.c_off_type == 'Full Day'
          @employee_leave_balance.total_leave = @employee_leave_balance.total_leave.to_f + 1
          @employee_leave_balance.no_of_leave = @employee_leave_balance.no_of_leave.to_f + 1
          @leave_c_off.leave_count = 1
        else
          @employee_leave_balance.total_leave = @employee_leave_balance.total_leave.to_f + 0.5
          @employee_leave_balance.no_of_leave = @employee_leave_balance.no_of_leave.to_f + 0.5
          @leave_c_off.leave_count = 0.5
        end
      else
        @employee_leave_balance = EmployeeLeavBalance.new do |b|
          b.employee_id = @leave_c_off.employee_id
          b.leav_category_id = leav_category.id
          b.expiry_date = @leave_c_off.c_off_date + @leave_c_off.c_off_expire_day

          if @leave_c_off.c_off_type == "Full Day"
            b.no_of_leave = 1
            b.total_leave = 1
            @leave_c_off.leave_count = 1
            puts @leave_c_off.leave_count
          else
            b.no_of_leave = 0.5
            b.total_leave = 0.5
            @leave_c_off.leave_count = 0.5
            puts @leave_c_off.leave_count
          end
        end
      end
      ActiveRecord::Base.transaction do
        puts @leave_c_off.leave_count
        @leave_c_off.save
        @employee_leave_balance.save
      end
    end
    @leave_c_off = LeaveCOff.new
  end

  # PATCH/PUT /leave_c_offs/1
  # PATCH/PUT /leave_c_offs/1.json
  def update
    @leave_c_off.update(leave_c_off_params)
    @leave_c_offs = LeaveCOff.all
    @leave_c_off = LeaveCOff.new
  end

  # DELETE /leave_c_offs/1
  # DELETE /leave_c_offs/1.json
  def destroy
    @leave_c_off.destroy
    @leave_c_offs = LeaveCOff.all
  end

  def search_by_c_off_date
    @leave_c_offs = LeaveCOff.all
    reporter(@leave_c_offs, template_class: PdfReportTemplate) do
      filter :c_off_date, type: :date
      column(:manual_employee_code, sortable: true) { |leave_c_off| leave_c_off.employee.try(:manual_employee_code) }
      column(:first_name, sortable: true) { |leave_c_off| full_name(leave_c_off.employee) }
      column(:c_off_date, sortable: true, &:c_off_date)
      column(:c_off_type, sortable: true, &:c_off_type)
      column(:c_off_expire_day, sortable: true, &:c_off_expire_day)
      column(:expiry_status, sortable: true, &:expiry_status)
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_leave_c_off
    @leave_c_off = LeaveCOff.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def leave_c_off_params
    params.require(:leave_c_off).permit(:employee_id, :c_off_date, :c_off_type, :c_off_expire_day, :expiry_status, :expiry_date, :leave_count)
  end
end
