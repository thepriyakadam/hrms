class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy, :ajax_joining_detail, :ajax_bank_detail, :ajax_qualification_detail, :ajax_new_qualification, :ajax_experience_detail, :ajax_new_experience, :ajax_skillset_detail, :ajax_new_skillset, :ajax_certification_detail, :ajax_new_certification, :ajax_award_detail, :ajax_new_award, :ajax_physical_detail, :ajax_family_detail, :ajax_new_family]
  #load_and_authorize_resource
  # GET /employees
  # GET /employees.json
  def index
    if current_user.class == Member
      if current_user.role.name == "Employee"
        @employees = Employee.where(id: current_user.employee_id)
        redirect_to home_index_path
      elsif current_user.role.name == "CompanyLocation"
        @employees = Employee.where(company_location_id: current_user.company_location_id)
      elsif current_user.role.name == "Department"
        @employees = Employee.where(department_id: current_user.department_id)
      elsif current_user.role.name == "Company"
        @employees = Employee.all
      elsif current_user.role.name == "Supervisor"
        @emp = Employee.find(current_user.employee_id)
        #@employees_indirect = @emp.indirect_subordinates
        #@employees_direct = @emp.subordinates
        @employees =  @emp.subordinates
      end
    else
      @employees = Employee.all
    end
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    authorize! :show, @employee
    #@joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
  end

  # GET /employees/new
  def new
    #UserPasswordMailer.test.deliver_now
    @employee = Employee.new
    #authorize! :create, @employee
    # @employee.build_joining_detail #here
  end

  # GET /employees/1/edit
  def edit
    authorize! :edit, @employee
    @country = @employee.country
    @states = @country.states
    @state = @employee.state
    @cities = @state.districts
    @form = 'employee'
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)
    authorize! :create, @employee
    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
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
    authorize! :destroy, @employee
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def assign_role
    if current_user.class == Group
      @employees = Employee.joins("LEFT JOIN members on members.employee_id = employees.id where members.employee_id is null")
    else
      if current_user.role.name == "Company"
        @employees = Employee.joins("LEFT JOIN members on members.employee_id = employees.id where members.employee_id is null")
      elsif current_user.role.name == "CompanyLocation"
        @employees = Employee.joins("LEFT JOIN members on members.employee_id = employees.id where members.employee_id is null and employees.company_location_id = #{current_user.company_location_id}")
      end
    end
    @all_employee_list = ReportingMaster.all.collect {|e| [e.try(:employee).try(:manual_employee_code).try(:to_s)+' '+e.try(:employee).try(:first_name).try(:to_s)+' '+e.try(:employee).try(:last_name).try(:to_s),e.try(:employee).id]}
    @all_role_list = Role.all.collect {|r| [r.name,r.id]}
  end

  def submit_form
    employee = Employee.find(params["login"]["employee_id"])
    #@department = Department.find(params["login"]["department_id"])
    user = Member.new do |u|
      if employee.email == "" or employee.email.nil?
        u.email = "#{employee.manual_employee_code}@xyz.com"
      else
        u.email = employee.email
      end
      u.password = '12345678'
      u.employee_id = employee.id
      u.department_id = employee.joining_detail.department_id
      u.company_id = employee.company_location.company_id
      u.company_location_id = employee.company_location_id
      #u.subdomain = Apartment::Tenant.current_tenant
      u.member_code = employee.employee_code
      u.manual_member_code = employee.manual_employee_code
      u.role_id = params["login"]["role_id"]
    end
    ActiveRecord::Base.transaction do
      if user.save
        employee.update_attributes(department_id: employee.joining_detail.department_id, manager_id: params["login"]["manager_id"], manager_2_id: params["login"]["manager_2_id"])
        flash[:notice] = "Employee assigned successfully."
        redirect_to assign_role_employees_path
        #UserPasswordMailer.welcome_email(company,pass).deliver_now
      else
        p user.errors
        flash[:alert] = "Employee not assigned successfully."
        redirect_to assign_role_employees_path
      end
    end
  end

  def basic_detail
    @employee = Employee.find(params[:id])
  end

  def ajax_joining_detail
    @joining_detail = JoiningDetail.new
  end

  def ajax_bank_detail
    @employee_bank_detail = EmployeeBankDetail.new
  end

  def ajax_qualification_detail
    @qualification = Qualification.new
  end

  def ajax_new_qualification
    @qualification = Qualification.new
  end

  def ajax_experience_detail
    @experience = Experience.new
  end

  def ajax_new_experience
    @experience = Experience.new
  end

  def ajax_skillset_detail
    @skillset = Skillset.new
  end

  def ajax_new_skillset
    @skillset = Skillset.new
  end

  def ajax_certification_detail
    @certification = Certification.new
  end

  def ajax_new_certification
    @certification = Certification.new
  end

  def ajax_award_detail
    @award = Award.new
  end

  def ajax_new_award
    @award = Award.new
  end

  def ajax_physical_detail
    @employee_physical = EmployeePhysical.new
  end

  def ajax_family_detail
    @family = Family.new
  end

  def ajax_new_family
    @family = Family.new
  end

  def ajax_show_textbox
    @value = params[:value]
  end

  def manager
    @employees = Employee.all
  end

  def edit_manager
    @employee = Employee.find(params[:id])
    @managers = ReportingMaster.all
  end

  def ajax_setup_payroll
    @salary_components = SalaryComponent.first(5)
  end

  def update_manager
    @employee = Employee.find(params[:id])
    @employee.manager_id = params[:employee][:manager_id]
    @employee.manager_2_id = params[:employee][:manager_2_id]
    if @employee.save
      @employees = Employee.all
      @flag = true
    else
      @flag = false
    end
  end

  def transfer_form
    
  end

  def transfer_employee
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # def manager_params
    #   params.require(:employee).permit(:manager_id, :manager_2_id)
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      #params.require(:employee).permit(:department_id, :first_name, :middle_name, :last_name, :date_of_birth, :contact_no, :email, :permanent_address, :city, :district, :state, :pin_code, :current_address, :adhar_no, :pan_no, :licence_no, :passport_no, :marital_status, :nationality_id, :blood_group_id, :handicap, :status, :employee_type_id, :gender)
      params.require(:employee).permit(:manual_employee_code, :company_location_id, :department_id, :first_name, :middle_name, :last_name, :date_of_birth, :contact_no, :email, :permanent_address, :city, :country_id, :district_id, :state_id, :pin_code, :current_address, :adhar_no, :pan_no, :licence_no, :passport_no, :marital_status, :nationality_id, :blood_group_id, :handicap, :status, :employee_type_id, :gender, :religion_id,:handicap_type, :cost_center_id)
        # joining_detail_attributes: [:joining_date, :reference_from, :admin_hr, :tech_hr, :designation, :employee_grade_id, :confirmation_date, :status, :probation_period, :notice_period, :medical_schem])
    end
end

