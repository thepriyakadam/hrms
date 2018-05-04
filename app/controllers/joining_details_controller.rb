
# require 'query_report/helper' # need to require the helper
class JoiningDetailsController < ApplicationController
  before_action :set_joining_detail, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /joining_details
  # GET /joining_details.json
  # include QueryReport::Helper # need to include itcontract_end_date

  def index
    @joining_details = JoiningDetail.all
  end

  # GET /joining_details/1
  # GET /joining_details/1.json
  def show
  end

  # GET /joining_details/new
  def new
    @joining_detail = JoiningDetail.new
    @employee = Employee.find(params[:format])
  end

  # GET /joining_details/1/edit
  def edit
    @employee = @joining_detail.employee
  end

  # POST /joining_details
  # POST /joining_details.json
  
  def show_contract
    employee_category = EmployeeCategory.find(params[:employee_category_id])
    if employee_category.name == "Contract"
      @flag = true
    else
      @flag = false
    end
  end

  def create
    @joining_detail = JoiningDetail.new(joining_detail_params)
    @employee = Employee.find(params[:joining_detail][:employee_id])
    if params[:flag] == "Full/Half"
      @joining_detail.contract_month = params[:contract_month]
      @contract_month = true
    else
      @joining_detail.contract_month = nil
      @contract_month = false
    end
    respond_to do |format|
      if @joining_detail.save
        EmployeePromotion.create(employee_id: @joining_detail.employee_id,department_id: @joining_detail.employee.department.id,employee_designation_id: @joining_detail.employee_designation_id,employee_grade_id: @joining_detail.employee_grade_id,employee_category_id: @joining_detail.employee_category_id,effective_from: @joining_detail.joining_date)
        #ChangeDesignation.create(employee_id: @joining_detail.employee_id,employee_designation_id: @joining_detail.employee_designation_id,effective_from: @joining_detail.joining_date,status: true, change_by_id: current_user.employee_id)
        @joining_detail.update(contract_month: @joining_detail.contract_month)
        #retirement_date
        employee = Employee.find_by(id: @joining_detail.employee_id)
        date_of_birth = employee.date_of_birth
        retirement_date = date_of_birth.to_date + 58.years
        #CONTRACTMONTH
        joining_date = @joining_detail.joining_date
        contract = @joining_detail.contract_month
        contract_month = contract.to_i
        @contract_end_date = joining_date.to_date + contract_month.months
        @joining_detail.update(contract_end_date: @contract_end_date,retirement_date: retirement_date)
        # format.html { redirect_to @employee, notice: 'Joining detail was successfully created.' }
        # format.json { render :show, status: :created, location: @joining_detail }
        format.js { @flag = true }
        EmployeeMailer.joining_create(@employee,@joining_detail).deliver_now  
      else
        flash.now[:alert] = 'Joining Detail exist for this employee'
        # format.html { render :new }
        # format.json { render json: @joining_detail.errors, status: :unprocessable_entity }
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /joining_details/1
  # PATCH/PUT /joining_details/1.json
  def update
    respond_to do |format|
      if @joining_detail.update(joining_detail_params)

        contract_month = params[:contract_month]
        joining_date = joining_detail_params[:joining_date]
        @contract_month = contract_month.to_i
        @joining_date = joining_date.to_date
        contract_end_date = @joining_date + @contract_month.months
        @joining_detail.update(contract_end_date: contract_end_date)

        @employee = Employee.find_by(id: @joining_detail.employee_id)
        @department = Department.find_by(id: @employee.department_id)
        # @employee_promotion = EmployeePromotion.where(employee_id: @joining_detail.employee_id).last
        # @employee_promotion.update(employee_id: @joining_detail.employee_id,department_id: @department.id,employee_designation_id: @joining_detail.employee_designation_id,employee_grade_id: @joining_detail.employee_grade_id,employee_category_id: @joining_detail.employee_category_id,effective_from: @joining_detail.joining_date)
        # format.html { redirect_to @joining_detail, notice: 'Joining detail was successfully updated.' }
        # format.json { render :show, status: :ok, location: @joining_detail }
        format.js { @flag = true }
        # EmployeeMailer.joining_create(@employee,@joining_detail).deliver_now  
      else
        # format.html { render :edit }
        # format.json { render json: @joining_detail.errors, status: :unprocessable_entity }
        format.js { @flag = true }
      end
        # EmployeeMailer.joining_create(@employee,@joining_detail).deliver_now  
    end
  end

  # DELETE /joining_details/1
  # DELETE /joining_details/1.json
  def destroy
    @joining_detail.destroy
    respond_to do |format|
      format.html { redirect_to joining_details_url, notice: 'Joining detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search_by_joining_date
    reporter(@joining_details, template_class: PdfReportTemplate) do
      filter :joining_date, type: :date
      column(:manual_employee_code, sortable: true) { |joining_detail| joining_detail.employee.try(:manual_employee_code) }
      column :employee_grade
      column :joining_date, sortable: true
      column(:date_of_birth, sortable: true) { |joining_detail| joining_detail.employee.try(:date_of_birth) }
      column(:employee_id, sortable: true) { |joining_detail| joining_detail.employee.try(:first_name) }
      column(:employee_grade, sortable: true) { |joining_detail| joining_detail.employee_grade.try(:name) }
      column(:employee_designation, sortable: true) { |joining_detail| joining_detail.employee_designation.try(:name) }
      column :confirmation_date, sortable: true
      column :employee_uan_no, sortable: true
      column :employee_pf_no, sortable: true
      column :employee_efic_no, sortable: true
      column :medical_schem, sortable: true
      column :passport_no, sortable: true
      column :passport_expiry_date, sortable: true
      column(:probation_period, sortable: true, &:probation_period)
      column(:notice_period, sortable: true, &:notice_period)
    end
 end

 def import_joining_detail
    session[:active_tab] ="EmployeeManagement"
    session[:active_tab1] ="Reports"  
 end

  def joining_detail_report
    @location = params[:salary][:company_location_id]
    if current_user.class == Group
      if params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
        @joining_details = JoiningDetail.all
      else
        @employees = Employee.where(company_location_id: @location.to_i)
        @joining_details = JoiningDetail.where(employee_id: @employees)
      end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
          @joining_details = JoiningDetail.all
        else
          @employees = Employee.where(company_location_id: @location.to_i)
          @joining_details = JoiningDetail.where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Branch'
        params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        @joining_details = JoiningDetail.where(employee_id: @employees)
      elsif current_user.role.name == 'HOD'
        @joining_details = JoiningDetail.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
       end
   end

  def import_xl
  end

  def import
    file = params[:file]
    if file.nil?
      flash[:alert] = "Please Select File!"
    redirect_to import_joining_detail_joining_details_path
    else
    JoiningDetail.import(params[:file])
    redirect_to import_joining_detail_joining_details_path, notice: "File imported."
    end
  end

  def display_inactive_employee
    @value = params[:value]
  end

  def certificate_print
    @employee = Employee.find(params[:salary][:employee_id])
    @certificate = params[:salary][:certificate]
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id) 
    @employee_salary_templates = EmployeeSalaryTemplate.where(employee_id: @employee.id)

    respond_to do |format|
        format.html
        format.pdf do
        render :pdf => 'certificate_print',
        layout: '/layouts/pdf.html.erb',
        :template => 'joining_details/offer_letter_print.pdf.erb',
        :orientation      => 'Landscape', # default , Landscape
        :page_height      => 1000,
        :dpi              => '300',
        :margin           => {:top    => 20, # default 10 (mm)
                      :bottom => 20,
                      :left   => 20,
                      :right  => 20},
        :show_as_html => params[:debug].present?
        end
     end
    # redirect_to certificate_joining_details_path
  end

  def joining_certificate

  end

  # def offer_letter_print
  #   @employee = Employee.find(params[:employee_id])
  #   @certificate = [:certificate]
  #   @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
  #   respond_to do |format|
  #       format.html
  #       format.pdf do
  #       render :pdf => 'certificate_print',
  #       layout: '/layouts/pdf.html.erb',
  #       :template => 'joining_details/offer_letter_print.pdf.erb',
  #       :orientation      => 'Landscape', # default , Landscape
  #       :page_height      => 1000,
  #       :dpi              => '300',
  #       :margin           => {:top    => 20, # default 10 (mm)
  #                     :bottom => 20,
  #                     :left   => 20,
  #                     :right  => 20},
  #       :show_as_html => params[:debug].present?
  #       end
  #    end
  # end
    

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_joining_detail
    @joining_detail = JoiningDetail.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def joining_detail_params
    params.require(:joining_detail).permit(:c_off_applicable_day,:c_off_expire,:contract_month,:contract_end_date,:c_off,:company_rfid,:gate_rfid,:leaving_date,:employee_id, :ot_rate, :ot_option, :is_new,:replacement_id,:joining_date, :basis_of_time, :employee_grade_id, :confirmation_date, :employee_uan_no, :employee_pf_no, :employee_efic_no, :probation_period, :notice_period, :medical_schem, :employee_designation_id, :passport_no, :passport_issue_date, :passport_expiry_date, :select_pf, :pf_max_amount, :have_esic, :payment_mode_id, :cost_center_id, :employee_category_id, :department_id, :have_retention, :retirement_date, :reserved_category_id, :is_da,:is_employeer_pf,:is_employeer_esic,:is_insurance,:have_passport, :is_family_pension, :is_bonus, :gps_track, :restricted_area)
  end
end
