class EmployeeTransfersController < ApplicationController
  before_action :set_employee_transfer, only: [:show, :edit, :update, :destroy]

  # GET /employee_transfers
  # GET /employee_transfers.json
  def index
    @employee_transfers = EmployeeTransfer.where(employee_id: current_user.employee_id)
  end

  # GET /employee_transfers/1
  # GET /employee_transfers/1.json
  def show
  end

  # GET /employee_transfers/new
  def new
    @employee_transfer = EmployeeTransfer.new
    session[:active_tab] = "transfer"
  end

  # GET /employee_transfers/1/edit
  def edit
  end

  # POST /employee_transfers
  # POST /employee_transfers.json
  def create
   # byebug
    @employee_transfer = EmployeeTransfer.new(employee_transfer_params)
    @employee = Employee.find(@employee_transfer.employee_id)
    @employee_transfer.reporting_master_id = @employee.manager_id
    @employee_transfer.current_status = "Pending"
    
    if @employee_transfer.is_available? 
      flash[:alert] = "Your Request already has been sent"
      redirect_to employee_transfers_path
    else
    respond_to do |format|
      if @employee_transfer.save
        ReportingEmployeeTransfer.create(reporting_master_id: current_user.employee_id, employee_transfer_id: @employee_transfer.id, status: "Pending")
        TransferHistory.create(employee_transfer_id: @employee_transfer.id,employee_id: @employee_transfer.employee_id,reporting_master_id: @employee_transfer.reporting_master_id,designation: @employee_transfer.designation,category: @employee_transfer.category,employee_company: @employee_transfer.employee_company,employee_company_location: @employee_transfer.employee_company_location,employee_department: @employee_transfer.employee_department,justification: @employee_transfer.justification,current_status: @employee_transfer.current_status,department_id:  @employee_transfer.employee.department_id,company_id: @employee_transfer.employee.company_id,company_location_id: @employee_transfer.employee.company_location_id,employee_designation_id: @employee_transfer.employee.joining_detail.employee_designation_id,employee_category_id: @employee_transfer.employee.joining_detail.employee_category_id)
        format.html { redirect_to @employee_transfer, notice: 'Employee transfer was successfully created.' }
        format.json { render :show, status: :created, location: @employee_transfer }
      else
        format.html { render :new }
        format.json { render json: @employee_transfer.errors, status: :unprocessable_entity }
       end
    end
  end
end

  # PATCH/PUT /employee_transfers/1
  # PATCH/PUT /employee_transfers/1.json
  def update
    respond_to do |format|
      if @employee_transfer.update(employee_transfer_params)
      TransferHistory.create(employee_transfer_id: @employee_transfer.id,employee_id: @employee_transfer.employee_id,reporting_master_id: @employee_transfer.reporting_master_id,designation: @employee_transfer.designation,category: @employee_transfer.category,employee_company: @employee_transfer.employee_company,employee_company_location: @employee_transfer.employee_company_location,employee_department: @employee_transfer.employee_department,justification: @employee_transfer.justification,current_status: @employee_transfer.current_status,department_id:  @employee_transfer.employee.department_id,company_id: @employee_transfer.employee.company_id,company_location_id: @employee_transfer.employee.company_location_id,employee_designation_id: @employee_transfer.employee.joining_detail.employee_designation_id,employee_category_id: @employee_transfer.employee.joining_detail.employee_category_id)
        # EmployeeTransferMailer.transfer_request(@employee_transfer).deliver_now
        format.html { redirect_to @employee_transfer, notice: 'Employee transfer was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_transfer }
      else
        format.html { render :edit }
        format.json { render json: @employee_transfer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_transfers/1
  # DELETE /employee_transfers/1.json
  def destroy
    respond_to do |format|
    @reporting_employee_transfer = ReportingEmployeeTransfer.where(employee_transfer_id: @employee_transfer.id).destroy_all
    @transfer_history = TransferHistory.where(employee_transfer_id: @employee_transfer.id).destroy_all
    @employee_transfer.destroy
      format.html { redirect_to employee_transfers_url, notice: 'Employee Transfer destroyed successfully.' }
      format.json { head :no_content }
    end
  end

  def transfer_request
    @employee_transfers = EmployeeTransfer.where("reporting_master_id = ? and (current_status = ? or current_status = ? or current_status = ?)",current_user.employee_id,"Pending","FirstApproved","Approved & Send Next")
    session[:active_tab] ="ManagerSelfService"
  end

  def first_approve
    @employee_transfer = EmployeeTransfer.find(params[:format])
    first_manager_id = @employee_transfer.employee.manager_id
    second_manager_id = @employee_transfer.employee.manager_2_id
    @employee_transfer.update(reporting_master_id: second_manager_id,current_status: "FirstApproved")
    ReportingEmployeeTransfer.create(reporting_master_id: current_user.employee_id, employee_transfer_id: @employee_transfer.id,status: "FirstApproved")
    TransferHistory.where(employee_transfer_id: @employee_transfer.id).update_all(current_status: "FirstApproved",reporting_master_id: current_user.employee_id)
    flash[:notice] = 'Transfer Request Approved Successfully'
    redirect_to transfer_request_employee_transfers_path
  end

  def approve_and_send_next 
    @employee_transfer = EmployeeTransfer.find(params[:format])
    employee = Employee.find_by(id: @employee_transfer.reporting_master_id)
    first_manager_id = employee.manager_id
    @employee_transfer.update(reporting_master_id: first_manager_id,current_status: "Approved & Send Next")
    ReportingEmployeeTransfer.create(employee_transfer_id: @employee_transfer.id,reporting_master_id: current_user.employee_id,status: "Approved & Send Next")
    TransferHistory.where(employee_transfer_id: @employee_transfer.id).update_all(current_status: "Approved & Send Next",reporting_master_id: current_user.employee_id)
    flash[:notice] = 'Transfer Request Approved Successfully'
    redirect_to transfer_request_employee_transfers_path
  end

  def approve_employee_transfer
    @employee_transfer = EmployeeTransfer.find(params[:format])
    @employee_transfer.update(current_status: "Approved",reporting_master_id: current_user.employee_id)
    ReportingEmployeeTransfer.create(employee_transfer_id: @employee_transfer.id,reporting_master_id: current_user.employee_id,status: "Approved")
    TransferHistory.where(employee_transfer_id: @employee_transfer.id).update_all(current_status: "Approved",reporting_master_id: current_user.employee_id)
    flash[:notice] = 'Transfer Request Approved Successfully'
    redirect_to transfer_request_employee_transfers_path
  end
 
  def reject_transfer
    @employee_transfer = EmployeeTransfer.find(params[:format])
    @employee_transfer.update(current_status: "Rejected",reporting_master_id: current_user.employee_id)
    ReportingEmployeeTransfer.create(employee_transfer_id: @employee_transfer.id,reporting_master_id: current_user.employee_id,status: "Rejected")
    @transfer_history = TransferHistory.where(employee_transfer_id: @employee_transfer.id).update_all(current_status: "Rejected")
    flash[:alert] = 'Transfer Request Rejected'
    redirect_to transfer_request_employee_transfers_path
  end

  def admin_employee_transfer
    session[:active_tab] = "AdminSelfService"
  end

  def final_approve_by_admin
    employee_id = params[:employee_transfer][:employee_id]
    employee_designation_id = params[:employee_transfer][:employee_designation_id]
    employee_category_id = params[:employee_transfer][:employee_category_id]
    company_id = params[:employee_transfer][:company_id]
    effective_from = params[:employee_transfer][:effective_from].to_date
    company_location_id = params[:employee] ? params[:employee][:company_location_id] : params[:company_location_id]
    department_id = params[:employee] ? params[:employee][:department_id] : params[:department_id]
    @emp = Employee.find_by(id: employee_id)
    @employee_transfers = EmployeeTransfer.where(employee_id: employee_id).last
    EmployeeTransfer.where(id: @employee_transfers).update_all(effective_to: effective_from)  
    @employee_transfer = EmployeeTransfer.create(employee_id: employee_id,employee_designation_id: employee_designation_id,employee_category_id: employee_category_id,company_id: company_id,company_location_id: company_location_id,effective_from: effective_from,department_id: department_id,reporting_master_id: current_user.employee_id,current_status: "FinalApproved")
    @emp.update(company_id: company_id,company_location_id: company_location_id,department_id: department_id)
    @joining_detail= JoiningDetail.find_by_employee_id(employee_id)    
    @joining_detail.update(employee_designation_id: employee_designation_id,employee_category_id: employee_category_id)
    ReportingEmployeeTransfer.create(employee_transfer_id: @employee_transfer.id,reporting_master_id: current_user.employee_id,status: "FinalApproved")
    TransferHistory.create(employee_transfer_id: @employee_transfer.id,current_status: "FinalApproved",reporting_master_id: current_user.employee_id,employee_id: employee_id,employee_designation_id: employee_designation_id,employee_category_id: employee_category_id,company_id: company_id,company_location_id: company_location_id,department_id: department_id)
    flash[:notice] = 'Transfer Request Created Successfully'
    redirect_to admin_employee_transfer_employee_transfers_path
  end

  def final_approval_transfer_list
     @employee_transfers = EmployeeTransfer.where(current_status: "Approved")
  end

  def final_approve
   # byebug
    @employee_id = params[:employee_transfer] ? params[:employee_transfer][:employee_id] : params[:employee_id]
    @employee_designation_id = params[:employee_transfer] ? params[:employee_transfer][:employee_designation_id] : params[:employee_designation_id]
    @employee_category_id = params[:employee_transfer] ? params[:employee_transfer][:employee_category_id] : params[:employee_category_id]
    @company = params[:employee_transfer] ? params[:employee_transfer][:company_id] : params[:company_id]
    @company_location_id = params[:employee] ? params[:employee][:company_location_id] : params[:company_location_id]
    @department_id = params[:employee] ? params[:employee][:department_id] : params[:department_id]
    @employees = params[:employee_transfer][:employee_id]
    @effective_from = params[:employee_transfer][:effective_from].to_date
    @employee_transfer = EmployeeTransfer.find(params[:employee_transfer_id])
    @employee_transfer.update(current_status: "FinalApproved",effective_from: @effective_from,reporting_master_id: current_user.employee_id,employee_designation_id: @employee_designation_id,employee_category_id: @employee_category_id,company_id: @company,company_location_id: @company_location_id,department_id: @department_id)
    @transfer = EmployeeTransfer.last.id - 1
    EmployeeTransfer.where(id: @transfer).update_all(effective_to: @effective_from)
    @joining_detail= JoiningDetail.find_by_employee_id(@employee_id)    
    @joining_detail.update(employee_designation_id: @employee_designation_id,employee_category_id: @employee_category_id)
    @employee = Employee.find_by_id(@employee_id)    
    @employee.update(company_id: @company,company_location_id: @company_location_id,department_id: @department_id)   
    ReportingEmployeeTransfer.create(employee_transfer_id: @employee_transfer.id,reporting_master_id: current_user.employee_id,status: "FinalApproved")
    TransferHistory.where(employee_transfer_id: @employee_transfer.id).update_all(current_status: "FinalApproved",reporting_master_id: current_user.employee_id)
    flash[:notice] = 'Transfer Request Approved Successfully'
    redirect_to transfer_request_employee_transfers_path
  end

  def employee_transfer_confirmation
    @employee_transfer = EmployeeTransfer.find(params[:format])
    @employee_transfers = EmployeeTransfer.where(employee_id: @employee_transfer.employee_id).order("id DESC")
    @reporting_employee_transfer = ReportingEmployeeTransfer.where(status: @employee_transfer.id)
    @employee = Employee.find_by_id(@employee_transfer.employee_id)
    @joining_detail= JoiningDetail.find_by_employee_id(@employee)
     
  end

  def employee_transfer_confirmation_2   
      @employee_transfer = EmployeeTransfer.find(params[:format])
      @employee_transfers = EmployeeTransfer.where(employee_id: @employee_transfer.employee_id).order("id DESC")
      @reporting_employee_transfer = ReportingEmployeeTransfer.where(status: @employee_transfer.id) 
      @employee = Employee.find_by_id(@employee_transfer.employee_id)
      @joining_detail= JoiningDetail.find_by_employee_id(@employee)
   end

  def modal_approve
    @employee_transfer = EmployeeTransfer.find(params[:format])
  end

  def send_request_to_higher_authority
    @employee_transfer = EmployeeTransfer.find(params[:emp_transfer_id])
    @employee_transfer.update(current_status: "Approved & Send Next",reporting_master_id: params[:employee_transfer][:reporting_master_id]) 
    TransferHistory.create(employee_transfer_id: @employee_transfer.id,employee_id: @employee_transfer.employee_id,reporting_master_id: @employee_transfer.reporting_master_id,employee_designation_id: @employee_transfer.employee_designation_id,employee_category_id: @employee_transfer.employee_category_id,company_id: @employee_transfer.company_id,company_location_id: @employee_transfer.company_location_id,department_id: @employee_transfer.department_id,justification: @employee_transfer.justification,current_status: @employee_transfer.current_status)
    ReportingEmployeeTransfer.create(reporting_master_id: @employee_transfer.reporting_master_id, employee_transfer_id: @employee_transfer.id, status: @employee_transfer.current_status) 
    EmployeeTransferMailer.approve_and_send_next(@employee_transfer).deliver_now
    flash[:notice] = 'Employee Transfer Send to Higher Authority'
    redirect_to transfer_request_employee_transfers_path
  end

  def modal_edit
    @employee_transfer = EmployeeTransfer.find(params[:format])
  end

  def update_transfer_details
    @employee_transfer = EmployeeTransfer.find(params[:emp_transfer_id])
    @employee_transfer.update(current_status: "Edit & Approved",employee_designation_id:  params[:employee_transfer][:employee_designation_id],employee_category_id: params[:employee_transfer][:employee_category_id],company_id: params[:employee_transfer][:company_id],company_location_id: params[:employee_transfer][:company_location_id],department_id: params[:employee_transfer][:department_id],justification: params[:employee_transfer][:justification])
    TransferHistory.create(employee_transfer_id: @employee_transfer.id,employee_id: @employee_transfer.employee_id,reporting_master_id: @employee_transfer.reporting_master_id,employee_designation_id: @employee_transfer.employee_designation_id,employee_category_id: @employee_transfer.employee_category_id,company_id: @employee_transfer.company_id,company_location_id: @employee_transfer.company_location_id,department_id: @employee_transfer.department_id,justification: @employee_transfer.justification,current_status: @employee_transfer.current_status)
    ReportingEmployeeTransfer.create(reporting_master_id: @employee_transfer.reporting_master_id, employee_transfer_id: @employee_transfer.id, status: @employee_transfer.current_status)
    EmployeeTransferMailer.edit_and_approve(@employee_transfer).deliver_now
 
    flash[:notice] = "Transfer Details Updated & Approved Successfully"
    redirect_to transfer_request_employee_transfers_path
  end

  # def modal_edit_and_send_next
  #   @employee_transfer = EmployeeTransfer.find(params[:format])
  # end

  # def update_and_send_next_transfer_details
  #   @employee_transfer = EmployeeTransfer.find(params[:emp_transfer_id])
  #   @transfer_history = TransferHistory.new
  #   @employee_transfer = EmployeeTransfer.find(params[:employee_transfer][:employee_transfer_id])
  #   @transfer_history.reporting_master_id = @employee_transfer.reporting_master_id
  #   @transfer_history.employee_designation_id = @employee_transfer.employee_designation_id
  #   @transfer_history.employee_category_id = @employee_transfer.employee_category_id
  #   @transfer_history.company_id = @employee_transfer.company_id
  #   @transfer_history.company_location_id = @employee_transfer.company_location_id
  #   @transfer_history.department_id = @employee_transfer.department_id
  #   @transfer_history.justification = @employee_transfer.justification
  #   @employee_transfer.update(reporting_master_id: params[:employee_transfer][:reporting_master_id],employee_designation_id: params[:employee_transfer][:employee_designation_id],employee_category_id: params[:employee_transfer][:employee_category_id],company_id: params[:employee_transfer][:company_id],company_location_id: params[:employee_transfer][:company_location_id],department_id: params[:employee_transfer][:department_id],justification: params[:employee_transfer][:justification],current_status: "Edit & Send Next")
  #   TransferHistory.create(employee_transfer_id: @employee_transfer.id,employee_id: @employee_transfer.employee_id,reporting_master_id: @employee_transfer.reporting_master_id,employee_designation_id: @employee_transfer.employee_designation_id,employee_category_id: @employee_transfer.employee_category_id,company_id: @employee_transfer.company_id,company_location_id: @employee_transfer.company_location_id,department_id: @employee_transfer.department_id,justification: @employee_transfer.justification,current_status: @employee_transfer.current_status)
  #   redirect_to transfer_request_employee_transfers_path
  #   ReportingEmployeeTransfer.create(employee_transfer_id: @employee_transfer.id, reporting_master_id: @employee_transfer.reporting_master_id, status: "Edit & Send Next")
  #   EmployeeTransferMailer.edit_and_send_next(@employee_transfer).deliver_now

  #   flash[:notice] = 'Transfer Request Successfully Updated & send to Higher Authority.'  

  # end

   def collect_company
    @employee = Employee.find(params[:id])
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @company_id = @employee.try(:company).try(:name)
    @company_location_id = @employee.try(:company_location).try(:name)
    @department_id = @employee.try(:department).try(:name)
    @designation_id = @joining_detail.try(:employee_designation).try(:name)
    @category_id = @joining_detail.try(:employee_category).try(:name)
  end

  def print_transfer_employee_name_report

     @employee_id = params[:employee_transfer] ? params[:employee_transfer][:employee_id] : params[:employee_id]
     @employee = Employee.find_by(id: @employee_id)
     @employee_transfers = EmployeeTransfer.where(employee_id: @employee_id)
      respond_to do |format|
        format.js
        format.xls {render template: 'employee_transfers/transfer_employee_name_report_xls.xls.erb'}
        format.html
        format.pdf do
        render pdf: 'transfer_employee_name_report_pdf',
              layout: 'pdf.html',
              orientation: 'Landscape',
              template: 'employee_transfers/transfer_employee_name_report_pdf.pdf.erb',
              # show_as_html: params[:debug].present?,
              :page_height      => 1000,
              :dpi              => '300',
              :margin           => {:top    => 10, # default 10 (mm)
                            :bottom => 10,
                            :left   => 20,
                            :right  => 20},
              :show_as_html => params[:debug].present?
        end
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_transfer
      @employee_transfer = EmployeeTransfer.find(params[:id])
    end

    def transfer_history_params
      params.require(:employee_transfer).permit(:to,:from,:employee_transfer_id,:employee_id,:reporting_master_id,:justification,:current_status,:designation,:category,:employee_company,:employee_company_location,:employee_department,:employee_designation_id,:employee_category_id,:company_id,:company_location_id,:department_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_transfer_params
      params.require(:employee_transfer).permit(:to,:from,:employee_id, :reporting_master_id, :justification,:designation,:category,:employee_company,:employee_company_location,:employee_department,:employee_designation_id,:employee_category_id,:company_id,:company_location_id,:department_id,:effective_from,:effective_to)
    end
  end
