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
    @employee_transfer = EmployeeTransfer.new(employee_transfer_params)
    @employee_transfer.current_status = "Pending"
    respond_to do |format|
      if @employee_transfer.save
        ReportingEmployeeTransfer.create(reporting_master_id: @employee_transfer.reporting_master_id, employee_transfer_id: @employee_transfer.id, status: @employee_transfer.current_status)
        TransferHistory.create(employee_transfer_id: @employee_transfer.id,employee_id: @employee_transfer.employee_id,reporting_master_id: @employee_transfer.reporting_master_id,employee_designation_id: @employee_transfer.employee_designation_id,employee_category_id: @employee_transfer.employee_category_id,company_id: @employee_transfer.company_id,company_location_id: @employee_transfer.company_location_id,department_id: @employee_transfer.department_id,justification: @employee_transfer.justification,current_status: @employee_transfer.current_status)
        EmployeeTransferMailer.transfer_request(@employee_transfer).deliver_now
        format.html { redirect_to @employee_transfer, notice: 'Employee transfer was successfully created.' }
        format.json { render :show, status: :created, location: @employee_transfer }
      else
        format.html { render :new }
        format.json { render json: @employee_transfer.errors, status: :unprocessable_entity }

      end
    end
  end

  # PATCH/PUT /employee_transfers/1
  # PATCH/PUT /employee_transfers/1.json
  def update
    respond_to do |format|
      if @employee_transfer.update(employee_transfer_params)
        EmployeeTransferMailer.transfer_request(@employee_transfer).deliver_now
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
    reporting_masters = ReportingMaster.find_by_employee_id(current_user.employee_id)
    @employee_transfers = EmployeeTransfer.where("reporting_master_id = ? and (current_status = ? or current_status = ? or current_status = ?)",reporting_masters,"Pending","Approved & Send Next","Edit & Send Next")
  end

  def employee_transfer_confirmation
    reporting_masters = ReportingMaster.find_by_employee_id(current_user.employee_id)
     @employee_transfer = EmployeeTransfer.find(params[:format])
     @employee_transfers = EmployeeTransfer.where(reporting_master_id: reporting_masters)
  end

  def approve_transfer
    @employee_transfer = EmployeeTransfer.find(params[:format])
    @employee_transfer.update(current_status: "Approved")
    ReportingEmployeeTransfer.create(reporting_master_id: @employee_transfer.reporting_master_id, employee_transfer_id: @employee_transfer.id, status: @employee_transfer.current_status)
    TransferHistory.create(employee_transfer_id: @employee_transfer.id,employee_id: @employee_transfer.employee_id,reporting_master_id: @employee_transfer.reporting_master_id,employee_designation_id: @employee_transfer.employee_designation_id,employee_category_id: @employee_transfer.employee_category_id,company_id: @employee_transfer.company_id,company_location_id: @employee_transfer.company_location_id,department_id: @employee_transfer.department_id,justification: @employee_transfer.justification,current_status: @employee_transfer.current_status)
    EmployeeTransferMailer.approve_transfer(@employee_transfer).deliver_now
    flash[:notice] = 'Employee Transfer Approved'
    redirect_to transfer_request_employee_transfers_path
  end

  def reject_transfer
    @employee_transfer = EmployeeTransfer.find(params[:format])
    @employee_transfer.update(current_status: "Rejected")
    ReportingEmployeeTransfer.create(reporting_master_id: @employee_transfer.reporting_master_id, employee_transfer_id: @employee_transfer.id, status: @employee_transfer.current_status)
    TransferHistory.create(employee_transfer_id: @employee_transfer.id,employee_id: @employee_transfer.employee_id,reporting_master_id: @employee_transfer.reporting_master_id,employee_designation_id: @employee_transfer.employee_designation_id,employee_category_id: @employee_transfer.employee_category_id,company_id: @employee_transfer.company_id,company_location_id: @employee_transfer.company_location_id,department_id: @employee_transfer.department_id,justification: @employee_transfer.justification,current_status: @employee_transfer.current_status)
    EmployeeTransferMailer.reject_transfer(@employee_transfer).deliver_now
    flash[:notice] = 'Employee Transfer Rejected'
    redirect_to transfer_request_employee_transfers_path
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_transfer
      @employee_transfer = EmployeeTransfer.find(params[:id])
    end

    def transfer_history_params
    params.require(:employee_transfer).permit(:employee_transfer_id,:employee_id,:reporting_master_id,:employee_designation_id,:employee_category_id,:company_id,:company_location_id,:department_id,:justification,:current_status)
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_transfer_params
      params.require(:employee_transfer).permit(:employee_id, :reporting_master_id, :employee_designation_id, :employee_category_id, :company_id, :company_location_id, :department_id, :justification)
    end
end
