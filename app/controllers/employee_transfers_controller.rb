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
        # @joining_detail = JoiningDetail.find_by_employee_id(@employee_id)
        # @employee = Employee.find_by_id(@employee_id)
        # TransferHistory.create(employee_designation_id: @joining_detail.employee_designation_id,employee_category_id: @joining_detail.employee_category_id,company_id:  @employee.company_id,company_location_id: @employee.company_location_id,department_id: @employee.department_id)
        # EmployeeTransferMailer.transfer_request(@employee_transfer).deliver_now

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
    @employee_transfer.destroy
    respond_to do |format|
      format.html { redirect_to employee_transfers_url, notice: 'Employee transfer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def transfer_request
    # reporting_masters = ReportingMaster.find_by_employee_id(current_user.employee_id)
    # @employee_transfers = EmployeeTransfer.where("reporting_master_id = ? and (current_status = ? or current_status = ? or current_status = ?)",reporting_masters,"Pending","Approved & Send Next","Edit & Send Next")
     @employee_transfers = EmployeeTransfer.where("reporting_master_id = ? and (current_status = ? or current_status = ? or current_status = ?)",current_user.employee_id,"Pending","FirstApproved","Approved & Send Next")

    session[:active_tab] = "transfer"
  end

   


   def approve_employee_transfer
    # byebug
  #new code
     @employee_transfer = EmployeeTransfer.find(params[:format])
     first_manager_id = @employee_transfer.employee
     if @employee_transfer.current_status == "Pending"
     @employee_transfer.update(current_status: "SecondApproved")
     ReportingEmployeeTransfer.create(employee_transfer_id: @employee_transfer.id,reporting_master_id: current_user.employee_id,status: "SecondApproved")
     flash[:notice] = 'Transfer Request Approved Successfully'
     redirect_to transfer_request_employee_transfers_path
     elsif  @employee_transfer.current_status == "Approved & Send Next"
     reporting_master = @employee_transfer.reporting_master_id
     employee = Employee.where(id: reporting_master).take
     first_manag_id = employee.manager_id
     @employee_transfer.update(current_status: "SecondApproved")
     ReportingEmployeeTransfer.create(employee_transfer_id: @employee_transfer.id,reporting_master_id: current_user.employee_id,status: "SecondApproved")
     flash[:notice] = 'Transfer Request Approved Successfully'
     redirect_to transfer_request_employee_transfers_path
     else
    end
  end
 
  def first_approve
    # byebug
    @employee_transfer = EmployeeTransfer.find(params[:format])
    first_manager_id = @employee_transfer.employee.manager_id
    second_manager_id = @employee_transfer.employee.manager_2_id
    if @employee_transfer.current_status == "FirstApproved"
    @employee_transfer.update(current_status: "SecondApproved")
    ReportingEmployeeTransfer.create(employee_transfer_id: @employee_transfer.id,reporting_master_id: second_manager_id,status: "SecondApproved")
    flash[:notice] = 'Transfer Request Approved Successfully at First Level'
    redirect_to transfer_request_employee_transfers_path
   elsif @employee_transfer.current_status == "Approved & Send Next"
     reporting_master = @employee_transfer.reporting_master_id
     employee = Employee.where(id: reporting_master).take
     first_manager_id = employee.manager_id
     second_manager_id = employee.manager_2_id
    @employee_transfer.update(current_status: "SecondApproved",reporting_master_id: first_manager_id)
    ReportingEmployeeTransfer.create(employee_transfer_id: @employee_transfer.id,reporting_master_id: current_user.employee_id,status: "SecondApproved")
    flash[:notice] = 'Transfer Request Approved Successfully'
    redirect_to transfer_request_employee_transfers_path
    else
    @employee_transfer.update(reporting_master_id: second_manager_id,current_status: "FirstApproved")
    ReportingEmployeeTransfer.create(reporting_master_id: first_manager_id, employee_transfer_id: @employee_transfer.id,status: "FirstApproved")
    flash[:notice] = 'Transfer Request Approved Successfully'
    redirect_to transfer_request_employee_transfers_path
    end
  end


  # def approve_transfer
  #   @employee_transfer = EmployeeTransfer.find(params[:format])
  #   @employee_transfer.update(current_status: "Approved")
  #   ReportingEmployeeTransfer.create(reporting_master_id: @employee_transfer.reporting_master_id, employee_transfer_id: @employee_transfer.id, status: @employee_transfer.current_status)
  #   TransferHistory.create(employee_transfer_id: @employee_transfer.id,employee_id: @employee_transfer.employee_id,reporting_master_id: @employee_transfer.reporting_master_id,employee_designation_id: @employee_transfer.employee_designation_id,employee_category_id: @employee_transfer.employee_category_id,company_id: @employee_transfer.company_id,company_location_id: @employee_transfer.company_location_id,department_id: @employee_transfer.department_id,justification: @employee_transfer.justification,current_status: @employee_transfer.current_status)
  #   EmployeeTransferMailer.approve_transfer(@employee_transfer).deliver_now
  #   flash[:notice] = 'Employee Transfer Approved'
  #   redirect_to transfer_request_employee_transfers_path
  # end

  def reject_transfer
    @employee_transfer = EmployeeTransfer.find(params[:format])
    @employee_transfer.update(current_status: "Rejected",reporting_master_id: current_user.employee_id)
    # TravelRequestHistory.create(employee_id: @travel_request.employee_id,travel_request_id: @travel_request.id,employee_id: @travel_request.id,application_date: @travel_request.application_date,traveling_date: @travel_request.traveling_date, tour_purpose: @travel_request.tour_purpose, place: @travel_request.place,total_advance: @travel_request.total_advance,reporting_master_id: @travel_request.reporting_master_id, travel_option_id: @travel_request.travel_option_id,current_status: "Reject")
    # @reporting_masters = ReportingMaster.where(employee_id: current_user.employee_id).pluck(:id)
    ReportingEmployeeTransfer.where(employee_transfer_id: @employee_transfer.id,reporting_master_id: current_user.employee_id)
    ReportingEmployeeTransfer.update_all(status: "Rejected")
    # TravelRequestMailer.reject_travel_request_email(@travel_request).deliver_now
    # flash[:alert] = 'Travel Request Rejected'
    flash[:alert] = 'Transfer Request Rejected'
    redirect_to transfer_request_employee_transfers_path
    # @employee_transfer = EmployeeTransfer.find(params[:format])
    # @employee_transfer.update(current_status: "Rejected")
    # ReportingEmployeeTransfer.create(reporting_master_id: @employee_transfer.reporting_master_id, employee_transfer_id: @employee_transfer.id, status: @employee_transfer.current_status)
    # TransferHistory.create(employee_transfer_id: @employee_transfer.id,employee_id: @employee_transfer.employee_id,reporting_master_id: @employee_transfer.reporting_master_id,employee_designation_id: @employee_transfer.employee_designation_id,employee_category_id: @employee_transfer.employee_category_id,company_id: @employee_transfer.company_id,company_location_id: @employee_transfer.company_location_id,department_id: @employee_transfer.department_id,justification: @employee_transfer.justification,current_status: @employee_transfer.current_status)
    # EmployeeTransferMailer.reject_transfer(@employee_transfer).deliver_now
    # flash[:notice] = 'Employee Transfer Rejected'
    # redirect_to transfer_request_employee_transfers_path
  end

   def approve_and_send_next 
    # byebug
    @employee_transfer = EmployeeTransfer.find(params[:format])
     reporting_master = @employee_transfer.reporting_master_id
     employee = Employee.where(id: reporting_master).take
     first_manager_id = employee.manager_id
     second_manager_id = employee.manager_2_id
     if employee.manager_id.present? && employee.manager_2_id.present?
        @employee_transfer.update(reporting_master_id: first_manager_id,current_status: "Approved & Send Next")
        ReportingEmployeeTransfer.create(employee_transfer_id: @employee_transfer.id,reporting_master_id: current_user.employee_id,status: "Approved & Send Next")
        flash[:notice] = 'Transfer Request Sent to Higher Authority for Approval'
        edirect_to transfer_request_employee_transfers_path
     elsif employee.manager_2_id.nil?
           @employee_transfer.update(reporting_master_id: first_manager_id,current_status: "Approved & Send Next")
           ReportingEmployeeTransfer.create(employee_transfer_id: @employee_transfer.id,reporting_master_id: current_user.employee_id,status: "Approved & Send Next")
           flash[:notice] = 'Transfer Request Approved Successfully'
           redirect_to transfer_request_employee_transfers_path
     end
  end

  # def final_approve
  #   # byebug
  #   @employee_transfer = EmployeeTransfer.find(params[:format])
  #   @employee_transfer.update(current_status: "FinalApproved",reporting_master_id: current_user.employee_id)
  #   ReportingEmployeeTransfer.create(employee_transfer_id: @employee_transfer.id,reporting_master_id: current_user.employee_id,status: "FinalApproved")
  #   # @employee_designation = params[:employee_transfer][:employee_designation_id]
  #   # @employee_category = params[:employee_transfer][:employee_category_id]
  #   # @company = params[:employee_transfer][:company_id]
  #   # @company_location_id = params[:employee_transfer][:company_location_id]
  #   # @department_id = params[:employee_transfer][:department_id]
  #   # EmployeeTransfer.update(employee_designation_id: @employee_designation,employee_category_id: @employee_category,company_id: @company_id,company_location_id: @company_location_id,department_id: @department_id)
  #   # TransferHistory.update(employee_designation_id: @employee_transfer.employee_designation_id,employee_category_id: @employee_transfer.employee_category_id,company_id: @employee_transfer.company_id,company_location_id: @employee_transfer.company_location_id,department_id: @employee_transfer.department_id)
  #   if @employee_transfer.current_status == "FinalApproved"
  #     flash[:notice] = 'Travel Request Approved Successfully'
  #     redirect_to transfer_request_employee_transfers_path
  #   else
  #     flash[:notice] = 'Travel Request Approved Successfully'
  #     redirect_to transfer_request_employee_transfers_path
  #   end
  # end
  

  def employee_transfer_confirmation
    # byebug
     # reporting_masters = ReportingMaster.find_by_employee_id(current_user.employee_id)
     # @employee_transfer = EmployeeTransfer.find(params[:format])
     # @employee_transfers = EmployeeTransfer.where(reporting_master_id: reporting_masters).order("id DESC")
     # @current_request = EmployeeTransfer.find(params[:format])
     # @employee = Employee.find(@current_request.employee_id)
    
      @employee_transfer = EmployeeTransfer.find(params[:format])
      @employee_transfers = EmployeeTransfer.where(id: @employee_transfer.id)
      @employee = Employee.find_by_id(@employee_transfer.employee_id)
      @joining_detail= JoiningDetail.find_by_employee_id(@employee)
  end

  def employee_transfer_confirmation_2
      
      @employee_transfer = EmployeeTransfer.find(params[:format])
      @employee_transfers = EmployeeTransfer.where(id: @employee_transfer.id)
      @employee = Employee.find_by_id(@employee_transfer.employee_id)
      @joining_detail= JoiningDetail.find_by_employee_id(@employee)
   end

  
  def final_approve
 # byebug
    @employee_id = params[:employee_transfer] ? params[:employee_transfer][:employee_id] : params[:employee_id]
    @employee_designation_id = params[:employee_transfer] ? params[:employee_transfer][:employee_designation_id] : params[:employee_designation_id]
    @employee_category_id = params[:employee_transfer] ? params[:employee_transfer][:employee_category_id] : params[:employee_category_id]
    @company = params[:employee_transfer] ? params[:employee_transfer][:company_id] : params[:company_id]
    @company_location_id = params[:employee] ? params[:employee][:company_location_id] : params[:company_location_id]
    @department_id = params[:employee] ? params[:employee][:department_id] : params[:department_id]
    @employee_transfer = EmployeeTransfer.find(params[:employee_transfer_id])
    @employee_transfer.update(current_status: "FinalApproved",reporting_master_id: current_user.employee_id,employee_designation_id: @employee_designation_id,employee_category_id: @employee_category_id,company_id: @company,company_location_id: @company_location_id,department_id: @department_id)
    @joining_detail= JoiningDetail.find_by_employee_id(@employee_id)    
    @joining_detail.update(employee_designation_id: @employee_designation_id,employee_category_id: @employee_category_id)
    @employee = Employee.find_by_id(@employee_id)    
    @employee.update(company_id: @company,company_location_id: @company_location_id,department_id: @department_id)   
    ReportingEmployeeTransfer.create(employee_transfer_id: @employee_transfer.id,reporting_master_id: current_user.employee_id,status: "FinalApproved")
 
    # @transfer_history = TransferHistory.find_by(employee_transfer_id: @employee_transfer.id)  
    # @transfer_history.update(employee_designation_id: @joining_detail.employee_designation_id,employee_category_id: @joining_detail.employee_category_id,company_id:  @employee.company_id,company_location_id: @employee.company_location_id,department_id: @employee.department_id)

    if @employee_transfer.current_status == "FinalApproved"
      flash[:notice] = 'Transfer Request Approved Successfully'
      redirect_to transfer_request_employee_transfers_path
    else
      flash[:notice] = 'Transfer Request Approved Successfully'
      redirect_to transfer_request_employee_transfers_path
    end
  end

  def final_approval_transfer_list
    # byebug
     @employee_transfers = EmployeeTransfer.where(current_status: "SecondApproved")
  end


  def modal_approve
    @employee_transfer = EmployeeTransfer.find(params[:format])
  end

  def send_request_to_higher_authority
    @employee_transfer = EmployeeTransfer.find(params[:emp_transfer_id])
    #TransferHistory.create(employee_transfer_id: @employee_transfer.id,employee_id: @employee_transfer.employee_id,reporting_master_id: @employee_transfer.reporting_master_id,employee_designation_id: @employee_transfer.employee_designation_id,employee_category_id: @employee_transfer.employee_category_id,company_id: @employee_transfer.company_id,company_location_id: @employee_transfer.company_location_id,department_id: @employee_transfer.department_id,justification: @employee_transfer.justification,current_status: @employee_transfer.current_status)
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
    #@employee_transfer.update(current_status: "Edit & Approved",employee_designation_id:  params[:employee_transfer][:employee_designation_id],employee_category_id: params[:employee_transfer][:employee_category_id],company_id: params[:employee_transfer][:company_id],company_location_id: params[:employee_transfer][:company_location_id],department_id: params[:employee_transfer][:department_id],justification: params[:employee_transfer][:justification])
    ReportingEmployeeTransfer.create(reporting_master_id: @employee_transfer.reporting_master_id, employee_transfer_id: @employee_transfer.id, status: @employee_transfer.current_status)
    EmployeeTransferMailer.edit_and_approve(@employee_transfer).deliver_now
 
    flash[:notice] = "Transfer Details Updated & Approved Successfully"
    redirect_to transfer_request_employee_transfers_path
  end

  def modal_edit_and_send_next
    @employee_transfer = EmployeeTransfer.find(params[:format])
    #@transfer_history = TransferHistory.where(employee_transfer_id: @employee_transfer.id)
  end

  def update_and_send_next_transfer_details
    @employee_transfer = EmployeeTransfer.find(params[:emp_transfer_id])
    @transfer_history = TransferHistory.new
    @employee_transfer = EmployeeTransfer.find(params[:employee_transfer][:employee_transfer_id])

    #@transfer_history.employee_id = @employee_transfer.employee_id
    @transfer_history.reporting_master_id = @employee_transfer.reporting_master_id
    @transfer_history.employee_designation_id = @employee_transfer.employee_designation_id
    @transfer_history.employee_category_id = @employee_transfer.employee_category_id
    @transfer_history.company_id = @employee_transfer.company_id
    @transfer_history.company_location_id = @employee_transfer.company_location_id
    @transfer_history.department_id = @employee_transfer.department_id
    @transfer_history.justification = @employee_transfer.justification
    #@transfer_history.current_status = @employee_transfer.current_status
    #@transfer_history.employee_transfer_id = @employee_transfer.id

    #@transfer_history.save
    @employee_transfer.update(reporting_master_id: params[:employee_transfer][:reporting_master_id],employee_designation_id: params[:employee_transfer][:employee_designation_id],employee_category_id: params[:employee_transfer][:employee_category_id],company_id: params[:employee_transfer][:company_id],company_location_id: params[:employee_transfer][:company_location_id],department_id: params[:employee_transfer][:department_id],justification: params[:employee_transfer][:justification],current_status: "Edit & Send Next")
    #@transfer_history = TransferHistory.new(transfer_history_params)
    TransferHistory.create(employee_transfer_id: @employee_transfer.id,employee_id: @employee_transfer.employee_id,reporting_master_id: @employee_transfer.reporting_master_id,employee_designation_id: @employee_transfer.employee_designation_id,employee_category_id: @employee_transfer.employee_category_id,company_id: @employee_transfer.company_id,company_location_id: @employee_transfer.company_location_id,department_id: @employee_transfer.department_id,justification: @employee_transfer.justification,current_status: @employee_transfer.current_status)
    redirect_to transfer_request_employee_transfers_path
    ReportingEmployeeTransfer.create(employee_transfer_id: @employee_transfer.id, reporting_master_id: @employee_transfer.reporting_master_id, status: "Edit & Send Next")
    EmployeeTransferMailer.edit_and_send_next(@employee_transfer).deliver_now

    flash[:notice] = 'Transfer Request Successfully Updated & send to Higher Authority.'  

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
    params.require(:employee_transfer).permit(:employee_transfer_id,:employee_id,:reporting_master_id,:justification,:current_status,:designation,:category,:employee_company,:employee_company_location,:employee_department,:employee_designation_id,:employee_category_id,:company_id,:company_location_id,:department_id)
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_transfer_params
      params.require(:employee_transfer).permit(:employee_id, :reporting_master_id, :justification,:designation,:category,:employee_company,:employee_company_location,:employee_department,:employee_designation_id,:employee_category_id,:company_id,:company_location_id,:department_id)
    end
end
