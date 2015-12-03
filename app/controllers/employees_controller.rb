class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    @joining_detail = JoiningDetail.find(@employee.id)
    #@employee_bank_detail = EmployeeBankDetail.find(@employee.id)
    # @qualification = Qualification.find(@employee.id)
    # @experience = Experience.find(@employee.id)
    # @family = Family.find(@employee.id)
    # @employee_physical = EmployeePhysical.find(@employee.id)
  end

  # GET /employees/new
  def new
    @employee = Employee.new
    # @employee.build_joining_detail #here
  end

  # GET /employees/1/edit
  def edit
    #@employee.build_joining_detail #here
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to new_joining_detail_path(@employee), notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def assign_role
    @employees = Employee.joins("LEFT JOIN members on members.employee_id = employees.id where members.employee_id is null")
    @roles = Role.all    
  end

  def submit_form
    employee = Employee.find(params["role"]["employee_id"])
    user = Member.new do |u|
      u.email = employee.email
      u.password = '12345678'
      u.employee_id = employee.id
      u.department_id = params["role"]["department_id"]
      #u.company_id = params["role"]["department_id"]
      #u.company_location_id = params["role"]["department_id"]
      u.subdomain = Apartment::Tenant.current_tenant
      u.member_code = employee.employee_code
      u.role_id = params["role"]["name"]
    end
    ActiveRecord::Base.transaction do
      if user.save
        employee.update_attributes(role_id: params["role"]["name"],manager_id: params["role"]["manager_id"])
        flash[:notice] = "Employee assigned successfully."
        redirect_to assign_role_employees_path
        #UserPasswordMailer.welcome_email(company,pass).deliver_now
      end
    end
  end

  def basic_detail
    @employee = Employee.find(params[:id])
  end

  def ajax_joining_detail
    @joining_detail = JoiningDetail.find(params[:id])
  end

  def ajax_bank_detail
    @employee_bank_detail = EmployeeBankDetail.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      #params.require(:employee).permit(:department_id, :first_name, :middle_name, :last_name, :date_of_birth, :contact_no, :email, :permanent_address, :city, :district, :state, :pin_code, :current_address, :adhar_no, :pan_no, :licence_no, :passport_no, :marital_status, :nationality_id, :blood_group_id, :handicap, :status, :employee_type_id, :gender)
      params.require(:employee).permit(:department_id, :first_name, :middle_name, :last_name, :date_of_birth, :contact_no, :email, :permanent_address, :city, :district, :state, :pin_code, :current_address, :adhar_no, :pan_no, :licence_no, :passport_no, :marital_status, :nationality_id, :blood_group_id, :handicap, :status, :employee_type_id, :gender, :religion,:handicap_type)
        # joining_detail_attributes: [:joining_date, :reference_from, :admin_hr, :tech_hr, :designation, :employee_grade_id, :confirmation_date, :status, :probation_period, :notice_period, :medical_schem])
    end
end
