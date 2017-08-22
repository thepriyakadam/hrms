require 'query_report/helper' # need to require the helper
class JoiningDetailsController < ApplicationController
  before_action :set_joining_detail, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /joining_details
  # GET /joining_details.json
  include QueryReport::Helper # need to include it

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
  def create
    @joining_detail = JoiningDetail.new(joining_detail_params)
    @employee = Employee.find(params[:joining_detail][:employee_id])
    respond_to do |format|
      if @joining_detail.save
        EmployeePromotion.create(employee_id: @joining_detail.employee_id,department_id: @joining_detail.employee.department.id,employee_designation_id: @joining_detail.employee_designation_id,employee_grade_id: @joining_detail.employee_grade_id,employee_category_id: @joining_detail.employee_category_id,effective_from: @joining_detail.joining_date)
        ChangeDesignation.create(employee_id: @joining_detail.employee_id,employee_designation_id: @joining_detail.employee_designation_id,effective_from: @joining_detail.joining_date,status: true, change_by_id: current_user.employee_id)
        # format.html { redirect_to @employee, notice: 'Joining detail was successfully created.' }
        # format.json { render :show, status: :created, location: @joining_detail }
        format.js { @flag = true }
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

        @employee = Employee.find_by(id: @joining_detail.employee_id)
        @department = Department.find_by(id: @employee.department_id)
        # @employee_promotion = EmployeePromotion.where(employee_id: @joining_detail.employee_id).last
        # @employee_promotion.update(employee_id: @joining_detail.employee_id,department_id: @department.id,employee_designation_id: @joining_detail.employee_designation_id,employee_grade_id: @joining_detail.employee_grade_id,employee_category_id: @joining_detail.employee_category_id,effective_from: @joining_detail.joining_date)
        # format.html { redirect_to @joining_detail, notice: 'Joining detail was successfully updated.' }
        # format.json { render :show, status: :ok, location: @joining_detail }
        format.js { @flag = true }
      else
        # format.html { render :edit }
        # format.json { render json: @joining_detail.errors, status: :unprocessable_entity }
        format.js { @flag = true }
      end
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

  def import_xl
    @joining_details = JoiningDetail.all
    respond_to do |format|
    format.html
    format.csv { send_data @joining_details.to_csv }
    format.xls
     session[:active_tab] = "import"
   end   
  end

  def import
    # byebug
    JoiningDetail.import(params[:file])
    redirect_to root_url, notice: "File imported."
  end

  def display_inactive_employee
    @value = params[:value]
  end

  def certificate_print
    # byebug
    @employee = Employee.find(params[:salary][:employee_id])
    @certificate = params[:salary][:certificate]
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id) 
    # redirect_to certificate_joining_details_path
  end

  def joining_certificate

  end
    

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_joining_detail
    @joining_detail = JoiningDetail.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def joining_detail_params
    params.require(:joining_detail).permit(:c_off,:company_rfid,:gate_rfid,:leaving_date,:employee_id, :ot_rate, :ot_option, :is_new,:replacement_id,:joining_date, :basis_of_time, :employee_grade_id, :confirmation_date, :employee_uan_no, :employee_pf_no, :employee_efic_no, :probation_period, :notice_period, :medical_schem, :employee_designation_id, :passport_no, :passport_issue_date, :passport_expiry_date, :select_pf, :pf_max_amount, :have_esic, :payment_mode_id, :cost_center_id, :employee_category_id, :department_id, :have_retention, :retirement_date, :reserved_category_id, :is_da,:is_employeer_pf,:is_employeer_esic,:is_insurance,:have_passport, :is_family_pension, :is_bonus)
  end
end
