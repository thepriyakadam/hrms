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
    session[:active_tab] ="rembursment"
  end

  # GET /rembursments/1
  # GET /rembursments/1.json
  def show
  # @rembursments =Rembursment.where(id: @rembursment.id)
  # @reporting_master_rembursments = ReportingMasterRembursment.where(rembursment_id: @rembursment.id)
  end

  # GET /rembursments/new
  def new
    @rembursment = Rembursment.new
    session[:active_tab] ="rembursment"
  end

  # GET /rembursments/1/edit
  def edit
  end

  # POST /rembursments
  # POST /rembursments.json
  def create
    # byebug
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


  def rembursment_request
    current_login = Employee.find(current_user.employee_id)
    @emp = current_login.subordinates.pluck(:id)
    @emp1 = current_login.indirect_subordinates.pluck(:id)
    # @pending_rembursment_requests = Rembursment.where(employee_id: @emp)
    # @first_approved_rembursment_requests = Rembursment.where(employee_id: @emp1)
    
    @rembursments = Rembursment.where("manager_id = ? and (status = ? or status = ? or status = ?)",current_user.employee_id,"Pending","FirstApproved","Approved & Send Next")
    session[:active_tab] ="rembursment"
  end

  def rembursment_confirmation
    @rembursment = Rembursment.find(params[:rembursment_id])
    @rembursments = Rembursment.where(employee_id: @rembursment.employee_id)
  end

  def single_approve
     # byebug
     @rembursment = Rembursment.find(params[:format])
     reporting_master = @rembursment.manager_id #new code
     employee = Employee.where(id: reporting_master).take #new code
     first_manager_id = employee.manager_id #new code
     second_manager_id = employee.manager_2_id #new code
    @rembursment.update(manager_id: second_manager_id,status: "FirstApproved")
    ReportingMasterRembursment.create(manager_id: current_user.employee_id, rembursment_id: @rembursment.id,status: "FirstApproved")
    flash[:notice] = 'Rembursment Request Approved Successfully'
     redirect_to rembursment_request_rembursments_path
    end

  def first_approve
    # byebug
    @rembursment = Rembursment.find(params[:format])
    first_manager_id = @rembursment.employee.manager_id
    second_manager_id = @rembursment.employee.manager_2_id
    if @rembursment.status == "FirstApproved"
    @rembursment.update(status: "SecondApproved")
    ReportingMasterRembursment.create(rembursment_id: @rembursment.id,manager_id: second_manager_id,status: "SecondApproved")
    flash[:notice] = 'Rembursment Request Approved Successfully at First Level'
    redirect_to rembursment_request_rembursments_path
   elsif @rembursment.status == "Approved & Send Next"
     reporting_master = @rembursment.manager_id
     employee = Employee.where(id: reporting_master).take
     first_manager_id = employee.manager_id
     second_manager_id = employee.manager_2_id
    @rembursment.update(status: "SecondApproved",manager_id: first_manager_id)
    ReportingMasterRembursment.create(rembursment_id: @rembursment.id,manager_id: current_user.employee_id,status: "SecondApproved")
    flash[:notice] = 'Rembursment Request Approved Successfully'
     redirect_to rembursment_request_rembursments_path
    else
      # byebug
     reporting_master = @rembursment.manager_id #new code
     employee = Employee.where(id: reporting_master).take #new code
     first_manager_id = employee.manager_id #new code
     second_manager_id = employee.manager_2_id #new code
    @rembursment.update(manager_id: first_manager_id,status: "FirstApproved")
    ReportingMasterRembursment.create(manager_id: current_user.employee_id, rembursment_id: @rembursment.id,status: "FirstApproved")
    flash[:notice] = 'Rembursment Request Approved Successfully'
     redirect_to rembursment_request_rembursments_path
    end
  end



 def reject_rembursment
    @rembursment = Rembursment.find(params[:format])
    @rembursment.update(status: "Rejected",manager_id: current_user.employee_id)
    ReportingMasterRembursment.create(rembursment_id: @rembursment.id,manager_id: current_user.employee_id,status: "Rejected")
    flash[:alert] = 'Rembursment Request Rejected'
    redirect_to rembursment_request_rembursments_path
  end

  def approve_rembursment
    # byebug
      @rembursment = Rembursment.find(params[:format])
     first_manager_id = @rembursment.employee
    if @rembursment.status == "Pending"
     @rembursment.update(status: "SecondApproved")
      ReportingMasterRembursment.create(rembursment_id: @rembursment.id,manager_id: current_user.employee_id,status: "SecondApproved")
      flash[:notice] = 'Rembursment Request Approved Successfully'
      redirect_to rembursment_request_rembursments_path
     elsif  @rembursment.status == "Approved & Send Next"
      reporting_master = @rembursment.manager_id
      employee = Employee.where(id: reporting_master).take
      first_manag_id = employee.manager_id
      @rembursment.update(status: "SecondApproved")
      ReportingMasterRembursment.create(rembursment_id: @rembursment.id,manager_id: current_user.employee_id,status: "SecondApproved")
      flash[:notice] = 'Rembursment Request Approved Successfully'
       redirect_to rembursment_request_rembursments_path
     else
    end
  end

   def approve_and_send_next
    # byebug
    @rembursment = Rembursment.find(params[:format])
     reporting_master = @rembursment.manager_id
     employee = Employee.where(id: reporting_master).take
     first_manager_id = employee.manager_id
     second_manager_id = employee.manager_2_id
     if employee.manager_id.present? && employee.manager_2_id.present?
        @rembursment.update(manager_id: first_manager_id,status: "Approved & Send Next")
        ReportingMasterRembursment.create(rembursment_id: @rembursment.id,manager_id: current_user.employee_id,status: "Approved & Send Next")
        flash[:notice] = 'Rembursment Request Sent to Higher Authority for Approval'
         redirect_to rembursment_request_rembursments_path
     elsif employee.manager_2_id.nil?
           @rembursment.update(manager_id: first_manager_id,status: "Approved & Send Next")
           ReportingMasterRembursment.create(rembursment_id: @rembursment.id,manager_id: current_user.employee_id,status: "Approved & Send Next")
           flash[:notice] = 'Rembursment Request Approved Successfully'
           redirect_to rembursment_request_rembursments_path
     end
  end

  def final_approve
    @rembursment = Rembursment.find(params[:format])
    @rembursment.update(status: "FinalApproved",manager_id: current_user.employee_id)
    ReportingMasterRembursment.create(rembursment_id: @rembursment.id,manager_id: current_user.employee_id,status: "FinalApproved")
    if @rembursment.status == "FinalApproved"
      flash[:notice] = 'Rembursment Request Approved Successfully'
      redirect_to final_approval_rembursment_rembursments_path
    else
      flash[:notice] = 'Rembursment Request Approved Successfully'
      redirect_to rembursment_request_rembursments_path
    end
  end

  def final_approval_rembursment
     @rembursments = Rembursment.where(status: "SecondApproved")
    session[:active_tab] ="rembursment"
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
