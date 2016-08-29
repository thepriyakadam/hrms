class ReportingMastersController < ApplicationController
  before_action :set_reporting_master, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @reporting_master = ReportingMaster.new
    @reporting_masters = ReportingMaster.all
    session[:active_tab] ="employeemanagement"
    session[:active_tab1] ="useradministration"
  end

  # GET /reporting_masters/1/edit
  def edit
  end

  # POST /reporting_masters
  # POST /reporting_masters.json
  def create
    @reporting_master = ReportingMaster.new(reporting_master_params)
    @reporting_masters = ReportingMaster.all
    respond_to do |format|
      if @reporting_master.save
        @reporting_master = ReportingMaster.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Reporting Manager Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /reporting_masters/1
  # PATCH/PUT /reporting_masters/1.json
  def update
    @reporting_master.update(reporting_master_params)
    @reporting_masters = ReportingMaster.all
    @reporting_master = ReportingMaster.new
  end

  # DELETE /reporting_masters/1
  # DELETE /reporting_masters/1.json
  def destroy
    @reporting_master.destroy
    @reporting_masters = ReportingMaster.all
  end

  def update_reporting_manager
  end

  def show_employee
    @reporting_master1 = params[:employee_id_1]
    #@employees = Employee.where("manager_id = ? OR manager_2_id = ?",@reporting_master1,@reporting_master1 )
    @employee_rms = Employee.where(manager_id: @reporting_master1)
    @employee_rm2s = Employee.where(manager_2_id: @reporting_master1)
  end

  def update_manager
    @reporting_master1 = params[:salary][:employee_id_1]
    @reporting_master2 = params[:salary][:employee_id_2]
    @effec_date = params[:salary][:effec_date]

    employee_ids = params[:employee_ids]
      if employee_ids.nil?
        flash[:alert] = "Please Select the Checkbox"
      else
        employee_ids.each do |e|
          emp = Employee.find(e)
          Employee.where(manager_id: @reporting_master1,id: emp.id).update_all(manager_id: @reporting_master2)
          Employee.where(manager_2_id: @reporting_master1,id: emp.id).update_all(manager_2_id: @reporting_master2)
          @manager = ManagerHistory.where(employee_id: emp.id).last
          #@manager_history = ManagerHistory.where("employee_id = ? AND manager_id = ? AND manager_2_id = ?", emp.id,emp.manager_id,emp.manager_2_id)
          @employee = Employee.find(emp.id)
          ManagerHistory.create(employee_id: emp.id,manager_id: @employee.manager_id,manager_2_id: @employee.manager_2_id,effective_from: @effec_date.to_date)

          @manager_history = ManagerHistory.where("employee_id = ? AND manager_id = ? AND manager_2_id = ?", emp.id,@employee.manager_id,@employee.manager_2_id)
          end
        end
    flash[:notice] = "Updated Successfully"
    redirect_to update_reporting_manager_reporting_masters_path
  end
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reporting_master
    @reporting_master = ReportingMaster.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def reporting_master_params
    params.require(:reporting_master).permit(:is_expences, :code, :name, :description, :employee_id)
  end
end
