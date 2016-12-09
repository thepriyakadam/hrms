class EmployeeCodeMastersController < ApplicationController
  before_action :set_employee_code_master, only: [:show, :edit, :update, :destroy]

  # GET /employee_code_masters
  # GET /employee_code_masters.json

  # GET /employee_code_masters/1
  # GET /employee_code_masters/1.json
  def show
  end

  # GET /employee_code_masters/new
  def new
    @employee_code_master = EmployeeCodeMaster.new
    @employee_code_masters = EmployeeCodeMaster.all
    session[:active_tab] ="master"
    session[:active_tab1] ="employeeprofilesetup"

  end

  # GET /employee_code_masters/1/edit
  def edit
  end

  def create
    @employee_code_master = EmployeeCodeMaster.new(employee_code_master_params)
    @employee_code_masters = EmployeeCodeMaster.all
    @employee_code_master.save
    @emp_code_master = EmployeeCodeMaster.new
    @emp_code_master = EmployeeCodeMaster.where(id: @employee_code_master.id).last(2).first
    EmployeeCodeMaster.where(id: @emp_code_master.id).update_all(last_range: @employee_code_master.range)
    flash[:notice] = "Created Successfully"
    redirect_to new_employee_code_master_path
  end

  # PATCH/PUT /employee_code_masters/1
  # PATCH/PUT /employee_code_masters/1.json
  def update
    @employee_code_master.update(employee_code_master_params)
    @employee_code_masters = EmployeeCodeMaster.all
    @employee_code_master = EmployeeCodeMaster.new
    # @emp_code_master = EmployeeCodeMaster.where(id: @employee_code_master.id).last(2).first
    # EmployeeCodeMaster.where(id: @emp_code_master.id).update_all(last_range: @employee_code_master.range)
    flash[:notice] = "Updated Successfully"
    redirect_to new_employee_code_master_path
  end

  # DELETE /employee_code_masters/1
  # DELETE /employee_code_masters/1.json
  def destroy
    @employee_code_master.destroy
    @employee_code_masters = EmployeeCodeMaster.all
  end

  def is_confirm
    @employee_code_master = EmployeeCodeMaster.find(params[:employee_code_master])
    EmployeeCodeMaster.find(@employee_code_master.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_employee_code_master_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_code_master
      @employee_code_master = EmployeeCodeMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_code_master_params
      params.require(:employee_code_master).permit(:name, :range, :last_range, :is_active, :is_confirm)
    end
end