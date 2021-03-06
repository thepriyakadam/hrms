class RembursmentsController < ApplicationController
  before_action :set_rembursment, only: [:show, :edit, :update, :destroy]

  # GET /rembursments
  # GET /rembursments.json
  def index
    if current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        @rembursments = Rembursment.all
      elsif current_user.role.name == 'Admin'
        @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
        @rembursments = Rembursment.where(employee_id: @employees)
      elsif current_user.role.name == 'Branch'
        @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
        @rembursments = Rembursment.where(employee_id: @employees)
      elsif current_user.role.name == 'HOD'
        @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
        @rembursments = Rembursment.where(employee_id: @employees)
      elsif current_user.role.name == 'Supervisor'
        @emp = Employee.find(current_user.employee_id)
        @employees = @emp.subordinates
        @rembursments = Rembursment.where(employee_id: @employees)
      else current_user.role.name == 'Employee'
        @rembursments = Rembursment.where(employee_id: current_user.employee_id)
        redirect_to home_index_path
      end
    else
      @employees = Employee.all
    end
    session[:active_tab] = "PayrollManagement"
    session[:active_tab1] ="EmployeeRembursment"
  end

  # GET /rembursments/1
  # GET /rembursments/1.json
  def show
  end

  # GET /rembursments/new
  def new
    @rembursment = Rembursment.new
    session[:active_tab] = "PayrollManagement"
    session[:active_tab1] ="EmployeeRembursment"
  end

  # GET /rembursments/1/edit
  def edit
  end

  # POST /rembursments
  # POST /rembursments.json
  def create
    @rembursment = Rembursment.new(rembursment_params)
    a=current_user.employee_id
    emp = Employee.where(id: a).take
    respond_to do |format|
      if @rembursment.save
        @employee = Employee.find_by(id: @rembursment.employee_id)
        @manager = @employee.manager_id
        # @manager2 = @rembursment.employee.manager_id 
        Rembursment.where(id: @rembursment.id).update_all(manager_id: @manager,status: "Pending")
        # @rembursments = Rembursment.find_by(id: @rembursment.id)
        ReportingMasterRembursment.create(rembursment_id: @rembursment.id,manager_id: current_user.employee_id,status: "Pending")
        format.html { redirect_to @rembursment, notice: 'Rembursment was successfully created.' }
        format.json { render :show, status: :created, location: @rembursment }
      else
        format.html { render :new }
        format.json { render json: @rembursment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rembursments/1
  # PATCH/PUT /rembursments/1.json
  def update
    respond_to do |format|
      if @rembursment.update(rembursment_params)
        format.html { redirect_to @rembursment, notice: 'Rembursment was successfully updated.' }
        format.json { render :show, status: :ok, location: @rembursment }
      else
        format.html { render :edit }
        format.json { render json: @rembursment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rembursments/1
  # DELETE /rembursments/1.json
  def destroy
    @rembursment.destroy
    respond_to do |format|
      format.html { redirect_to rembursments_url, notice: 'Rembursment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #Rembursment Request Process Begin 
  def approval_list
    current_login = Employee.find(current_user.employee_id)
    @rembursments = Rembursment.where(manager_id: current_user.employee_id).where("status = ? || status = ? || status = ?","Pending","Approved & Send Next","FirstApproved")

    session[:active_tab] = "PayrollManagement"
    session[:active_tab1] ="EmployeeRembursment"
  end

  def approval_detail
    @rembursment = Rembursment.find(params[:rembursment_id])
    @rembursments = Rembursment.where(employee_id: @rembursment.employee_id)
  end

  def cancel
    @rembursment = Rembursment.find(params[:format])
    ReportingMasterRembursment.create(rembursment_id: @rembursment.id,manager_id: current_user.employee_id,status: "Cancelled") 
    @rembursment.update(status: "Cancelled",manager_id: current_user.employee_id)
    flash[:notice] = "Rembursment Cancelled Successfully!"
    redirect_to rembursments_path
  end

  def first_approve
    @rembursment = Rembursment.find(params[:format])
    employee = Employee.find_by(id: @rembursment.employee_id)
    first_manager_id = employee.manager_id 
    second_manager_id = employee.manager_2_id 
    @rembursment.update(manager_id: second_manager_id,status: "FirstApproved")
    ReportingMasterRembursment.create(manager_id: current_user.employee_id, rembursment_id: @rembursment.id,status: "FirstApproved")
    flash[:notice] = 'Rembursment Request Approved Successfully at First Level'
    redirect_to approval_list_rembursments_path
  end

  def approve
    @rembursment = Rembursment.find(params[:format])
    @rembursment.update(status: "Approved")
    ReportingMasterRembursment.create(rembursment_id: @rembursment.id,manager_id: current_user.employee_id,status: "Approved")
    flash[:notice] = 'Rembursment Request Approved Successfully'
    redirect_to approval_list_rembursments_path
  end

 def reject
    @rembursment = Rembursment.find(params[:format])
    @rembursment.update(status: "Rejected",manager_id: current_user.employee_id)
    ReportingMasterRembursment.create(rembursment_id: @rembursment.id,manager_id: current_user.employee_id,status: "Rejected")
    flash[:alert] = 'Rembursment Request Rejected'
    redirect_to approval_list_rembursments_path
  end

  def approve_and_send_next
    @rembursment = Rembursment.find(params[:format])
    reporting_master = @rembursment.manager_id
    employee = Employee.where(id: reporting_master).take
    first_manager_id = employee.manager_id
    @rembursment.update(manager_id: first_manager_id,status: "Approved & Send Next")
    ReportingMasterRembursment.create(rembursment_id: @rembursment.id,manager_id: current_user.employee_id,status: "Approved & Send Next")
    flash[:notice] = 'Rembursment Request Sent to Higher Authority for Approval'
    redirect_to approval_list_rembursments_path
  end

  def final_approval_list
    @rembursments = Rembursment.where(status: "Approved")
    session[:active_tab] = "PayrollManagement"
    session[:active_tab1] ="EmployeeRembursment"
  end

  def final_approve
    @rembursment = Rembursment.find(params[:format])
    @rembursment.update(status: "FinalApproved",manager_id: current_user.employee_id)
    ReportingMasterRembursment.create(rembursment_id: @rembursment.id,manager_id: current_user.employee_id,status: "FinalApproved")
    flash[:notice] = 'Rembursment Request Approved Successfully'
    redirect_to final_approval_list_rembursments_path
  end
  #End Of Rembursment Request Process

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rembursment
      @rembursment = Rembursment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rembursment_params
      params.require(:rembursment).permit(:employee_id, :manager_id, :application_date, :rembursment_date, :rembursmentmaster_id, :amount, :paid_date, :status)
    end
end
