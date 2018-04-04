class EmployeeBankDetailsController < ApplicationController
  before_action :set_employee_bank_detail, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /employee_bank_details
  # GET /employee_bank_details.json
  def index
    @employee_bank_details = EmployeeBankDetail.all
  end

  # GET /employee_bank_details/1
  # GET /employee_bank_details/1.json
  def show
  end

  # GET /employee_bank_details/new
  def new
    @employee_bank_detail = EmployeeBankDetail.new
  end

  # GET /employee_bank_details/1/edit
  def edit
    authorize! :edit, @employee_bank_detail
    @employee = @employee_bank_detail.employee
  end

  # POST /employee_bank_details
  # POST /employee_bank_details.json
  def create
    @employee_bank_detail = EmployeeBankDetail.new(employee_bank_detail_params)
    @employee = Employee.find(params[:employee_bank_detail][:employee_id])
    EmployeeMailer.bank_create(@employee,@employee_bank_detail).deliver_now  
  end
  # PATCH/PUT /employee_bank_details/1
  # PATCH/PUT /employee_bank_details/1.json
  def update
    respond_to do |format|
      if @employee_bank_detail.update(employee_bank_detail_params)
        # format.html { redirect_to @employee_bank_detail, notice: 'Employee bank detail was successfully updated.' }
        # format.json { render :show, status: :ok, location: @employee_bank_detail }
        format.js { @flag = true }
         # EmployeeMailer.bank_create(@employee,@employee_bank_detail).deliver_now  
      else
        # format.html { render :edit }
        # format.json { render json: @employee_bank_detail.errors, status: :unprocessable_entity }
        @employee = @employee_bank_detail.employee
        format.js { @flag = false }
      end
    EmployeeMailer.bank_create(@employee,@employee_bank_detail).deliver_now 
    end
  end

  # DELETE /employee_bank_details/1
  # DELETE /employee_bank_details/1.json
  def destroy
    @employee_bank_detail.destroy
    respond_to do |format|
      format.html { redirect_to employee_bank_details_url, notice: 'Employee bank detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def import_bank_detail
    session[:active_tab] ="EmployeeManagement"
    session[:active_tab1] ="Reports"
  end
  
  def bank_detail_report
    @location = params[:salary][:company_location_id]
    if current_user.class == Group
      if params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
        @employee_bank_details = EmployeeBankDetail.all
      else
        @employees = Employee.where(company_location_id: @location.to_i)
        @employee_bank_details = EmployeeBankDetail.where(employee_id: @employees)
      end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
          @employee_bank_details = EmployeeBankDetail.all
        else
          @employees = Employee.where(company_location_id: @location.to_i)
          @employee_bank_details = EmployeeBankDetail.where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Branch'
        params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        @employee_bank_details = EmployeeBankDetail.where(employee_id: @employees)
      elsif current_user.role.name == 'HOD'
        @employee_bank_details = EmployeeBankDetail.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
    end
  end

  def import_xl
    session[:active_tab] ="EmployeeManagement"
    session[:active_tab1] ="Import" 

  end

  def import
    # byebug
    file = params[:file]
    if file.nil?
      flash[:alert] = "Please Select File!"
    redirect_to import_bank_detail_employee_bank_details_path
    else
    EmployeeBankDetail.import(params[:file])
    redirect_to import_bank_detail_employee_bank_details_path, notice: "File imported."
    end
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_employee_bank_detail
    @employee_bank_detail = EmployeeBankDetail.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def employee_bank_detail_params
    params.require(:employee_bank_detail).permit(:employee_id, :account_no, :bank_id, :branch_name, :address, :contact_no, :micr_code, :branch_code, :ifsc_code)
  end
end