class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy, :ajax_joining_detail, :ajax_bank_detail, :ajax_qualification_detail, :ajax_new_qualification, :ajax_experience_detail, :ajax_new_experience, :ajax_skillset_detail, :ajax_new_skillset, :ajax_certification_detail, :ajax_new_certification, :ajax_award_detail, :ajax_new_award, :ajax_physical_detail, :ajax_family_detail, :ajax_new_family]
  # load_and_authorize_resource
  # GET /employees
  # GET /employees.json
  def index
    if current_user.class == Member
      if current_user.role.name == 'Employee'
        @employees = Employee.where(id: current_user.employee_id)
        redirect_to home_index_path
      elsif current_user.role.name == 'CompanyLocation'
        @employees = Employee.where(company_location_id: current_user.company_location_id)
      elsif current_user.role.name == 'Department'
        @employees = Employee.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Company'
        @employees = Employee.all
      elsif current_user.role.name == 'Supervisor'
        @emp = Employee.find(current_user.employee_id)
        # @employees_indirect = @emp.indirect_subordinates
        # @employees_direct = @emp.subordinates
        @employees = @emp.subordinates
      end
    else
      @employees = Employee.all
    end

      session[:active_tab] ="EmployeeManagement"
      session[:active_tab1] ="Employee1"
  end
  

  def import_xl
    @employees = Employee.all
    respond_to do |format|
    format.html
    format.csv { send_data @employee_bank_details.to_csv }
    format.xls
   end     
  end

  def import
    Employee.import(params[:file])
    redirect_to root_url, notice: "File imported."
  end

  def report
    @employees = Employee.all
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ReportPdf.new(@employees)
        send_data pdf.render, filename: 'Employee List.pdf', type: 'application/pdf'
      end
    end
  end

  def birthday_email
    date = Date.today
    @employees = Employee.where("strftime('%d/%m', date_of_birth) = ?", date.strftime('%d/%m'))
    if @employees.empty?
    else
      @employees.each do |e|
        EmployeeMailer.birthday_email(e).deliver_now
        flash[:notice] = 'Birthday Email Sent'
      end
    end
    redirect_to root_url
  end

  def birthday_invitation
    date = Date.today 
    @employees = Employee.where.not("strftime('%d/%m', date_of_birth) = ?", date.strftime('%d/%m'))
    if @employees.empty?
    else
    @employees.each do |employee|    
     EmployeeMailer.birthday_invitation(employee).deliver_now
   end
  end
  redirect_to root_url 
 end 

  # GET /employees/1
  # GET /employees/1.json
  def show
    authorize! :show, @employee
    # @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
  end

  # GET /employees/new
  def new
    # UserPasswordMailer.test.deliver_now
    @employee = Employee.new
    # authorize! :create, @employee
    # @employee.build_joining_detail #here
  end

  # GET /employees/1/edit
  def edit
    authorize! :edit, @employee
    @country = @employee.country
    @states = @country.states
    @state = @employee.state
    @cities = @state.districts

    @company = @employee.company
    @company_locations = @company.try(:company_locations)
    @company_location = @employee.company_location
    @departments = @company_location.try(:departments)


    @form = 'employee'
  end

   

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)
    @department = Department.find(@employee.department_id)
    authorize! :create, @employee
    # byebug
    
      if @employee.save
        @emp1=params[:employee][:employee_code_master_id]
        EmployeeCodeMaster.where(id: @emp1).update_all(last_range: @employee.manual_employee_code)
        @employee.update(company_location_id: @department.company_location_id,company_id: @department.company_location.company_id)
        redirect_to @employee    
      else
        render :new
      end
  end


  def display_emp_code_master
    # byebug
    @emp1= params[:id]
    @emp_master_code = EmployeeCodeMaster.where(id: @emp1,is_active: true).take
    @last = @emp_master_code.last_range.succ
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
      @employees = Employee.joins('LEFT JOIN members on members.employee_id = employees.id where members.employee_id is null')
    else
      if current_user.role.name == 'Company'
        @employees = Employee.joins('LEFT JOIN members on members.employee_id = employees.id where members.employee_id is null')
      elsif current_user.role.name == 'CompanyLocation'
        @employees = Employee.joins("LEFT JOIN members on members.employee_id = employees.id where members.employee_id is null and employees.company_location_id = #{current_user.company_location_id}")
      end
    end
    # @all_employee_list = ReportingMaster.all.collect { |e| [e.try(:employee).try(:manual_employee_code).try(:to_s) + ' ' + e.try(:employee).try(:first_name).try(:to_s) + ' ' + e.try(:employee).try(:last_name).try(:to_s), e.try(:employee).id] }
    # @all_role_list = Role.all.collect { |r| [r.name, r.id] }

   session[:active_tab] ="UserAdministration"
  end

  def submit_form
    employee = Employee.find(params['login']['employee_id'])
    # @department = Department.find(params["login"]["department_id"])
    user = Member.new do |u|
      u.email = if employee.email == '' || employee.email.nil?
                  "#{employee.manual_employee_code}@xyz.com"
                else
                  employee.email
                end
      u.password = '12345678'
      u.employee_id = employee.id
      u.department_id = employee.department_id
      u.company_id = employee.company_location.company_id
      u.company_location_id = employee.company_location_id
      # u.subdomain = Apartment::Tenant.current_tenant
      u.member_code = employee.employee_code
      u.manual_member_code = employee.manual_employee_code
      u.role_id = params['login']['role_id']
    end
    ActiveRecord::Base.transaction do
      if user.save
        employee.update_attributes(manager_id: params["login"]["manager_id"], manager_2_id: params["login"]["manager_2_id"])

        ManagerHistory.create(employee_id: employee.id,manager_id: params["login"]["manager_id"],manager_2_id: params["login"]["manager_2_id"],effective_from: params["login"]["effec_date"])
        
        flash[:notice] = "Employee assigned successfully."
        redirect_to assign_role_employees_path
        # UserPasswordMailer.welcome_email(company,pass).deliver_now
      else
        p user.errors
        flash[:alert] = 'Employee not assigned successfully.'
        redirect_to assign_role_employees_path
      end
    end
  end

  # def index_xls
  #   @employees = Employee.all
  #   respond_to do |format|
  #     format.xls {render template: 'employees/index.xls.erb'}
  #   end

  # end

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

  def ajax_assigned_asset_detail
    @assigned_asset = AssignedAsset.new
    @employee = Employee.find(params[:id])
  end
  
  def ajax_new_assigned_asset
    @assigned_asset = AssignedAsset.new
     @employee = Employee.find(params[:id])
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

  def ajax_employee_nomination_detail
    @employee_nomination = EmployeeNomination.new
    @employee = Employee.find(params[:id])
  end

  def ajax_new_employee_nomination
    @employee_nomination = EmployeeNomination.new
    @employee = Employee.find(params[:id])
  end

  def ajax_show_textbox
    @value = params[:value]
  end

  def ajax_employee_document_detail
    @employee_document = EmployeeDocument.new
    @employee = Employee.find(params[:id])
    #@employee_documents = EmployeeDocument.all
  end

  def ajax_new_employee_document
    @employee_document = EmployeeDocument.new
    @employee = Employee.find(params[:id])
    #@employee_documents = EmployeeDocument.all
  end

  def manager
    @employees = Employee.where.not(manager_id: nil)
    session[:active_tab] ="UserAdministration"
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
    @effec_date = params[:employee][:effec_date]
    
    if @employee.save
      @employees = Employee.all
      @mngr = ManagerHistory.create(employee_id: @employee.id,manager_id: @employee.manager_id,manager_2_id: @employee.manager_2_id,effective_from: @effec_date.to_date)
      @manager = ManagerHistory.where(employee_id: @employee.id).last(2).first
      ManagerHistory.where(id: @manager.id).update_all(effective_to: @mngr.effective_from)

      @flag = true
    else
      @flag = false
    end
  end

  def transfer_form
    @employee = Employee.find(params[:id])
  end

  def transfer_employee
    @department = Department.find(params[:employee][:department_id])
    @company_location = CompanyLocation.find(@department.company_location_id)
    @company = Company.find(@company_location.company_id)
    @employee = Employee.find(params[:id])
    @member = @employee.member

    ActiveRecord::Base.transaction do
      @employee.update(company_id: @company.id, company_location_id: @company_location.id, department_id: @department.id)
      @member.update(company_id: @company.id, company_location_id: @company_location.id, department_id: @department.id)
    end
    flash[:notice] = 'Employee Transfer successfully.'
    redirect_to transfer_employee_list_employees_path
  end

  def transfer_employee_list
    @employees = Employee.all 
  end

  def employee_list_for_revert
    @employees = Employee.where(status: "Inactive")
    session[:active_tab] ="UserAdministration"
  end

  def revert_employee
    @employee = Employee.find(params[:emp_id])
    Employee.where(id: @employee.id).destroy_all
    flash[:notice] = "Revert Successfully"
    redirect_to employee_list_for_revert_employees_path
  end

  def all_emp_list
     @employees = Employee.all
     # session[:active_tab] ="employeemanagement"
     session[:active_tab] ="UserAdministration"
  end

  def update_status
    @employee_ids = params[:employee_ids]
    @status = params[:employee][:status]
    if @employee_ids.nil?
      flash[:alert] = "Please Select the Checkbox"
      redirect_to all_emp_list_employees_path
    else
      @employee_ids.each do |eid|
      @employee = Employee.find(eid)
      @employee.update(status: @status) 
      flash[:notice] = "Status Updated Successfully"
    end 
     redirect_to all_emp_list_employees_path
  end
  end

  def update_password
    # byebug
    @id = params[:employee][:id]
    @password = params[:employee][:password]
    @member = Member.where(employee_id: @id).update_all(encrypted_password: @password)
    flash[:notice] = "Password Changed Successfully"
    redirect_to change_password_form_employees_path
  end



  def collect_company_location
    # byebug
    @company = Company.find(params[:id])
    # @company_locations = @company.company_locations
    if current_user.class == Group
    @company_locations = CompanyLocation.where(company_id: @company.id)
    else
      if current_user.role.name == 'Company'
        @company_locations = CompanyLocation.where(company_id: @company.id)
      elsif current_user.role.name == 'CompanyLocation'
        @company_locations = CompanyLocation.where(id: current_user.company_location_id,company_id: @company.id)
      end
    end
    @form = params[:form]
  end

  # def collect_company_location
  #    @company = Company.find(params[:id])
  #    @company_locations = CompanyLocation.where(company_id: @company.id)
  #    @form = params[:form]
  # end

  def collect_department
     @company_location = CompanyLocation.find(params[:id])
     @departments = Department.where(company_location_id: @company_location.id)
     @form = params[:form]
  end

  def basic_info_company_wise
  end


  # def basic_info_company_wise
  # end

  # def employee_basic_info
  #   @company = params[:employee][:company_id]
  #   @location = params[:employee][:company_location_id]
  #   @employees = Employee.where(company_id: @company,company_location_id: @location)
  # end

  def basic_info 
    employee_ids = params[:employee_ids]
    if employee_ids.nil?
      flash[:alert] = "Please Select the Checkbox"
      @employees = []
      redirect_to basic_info_company_wise_employees_path
    else
      @employees = []
      employee_ids.each do |e|
      emp = Employee.find(e)
      @employees << emp
      @employee = Employee.find(e)
      end
    end  
  end

  def emp_basic_info
  end
  
  def destroy_employee
  end

  def show_employee_detail
    @employee = Employee.find(params[:salary][:employee_id])
  end

  # def destroy_details
  #   @employee = Employee.find(params[:emp_id])
  #   Employee.find_by(id: @employee.id).destroy
  #   JoiningDetail.where(employee_id: @employee.id).destroy_all
  #   Salaryslip.where(employee_id: @employee.id).destroy_all
  #   EmployeeNomination.where(employee_id: @employee.id).destroy_all
  #   Award.where(employee_id: @employee.id).destroy_all
  #   Certification.where(employee_id: @employee.id).destroy_all
  #   InterviewSchedule.where(employee_id: @employee.id).destroy_all
  #   VacancyMaster.where(employee_id: @employee.id).destroy_all
  #   Qualification.where(employee_id: @employee.id).destroy_all
  #   EmployeeLeavRequest.where(employee_id: @employee.id).destroy_all
  #   EmployeeLeavBalance.where(employee_id: @employee.id).destroy_all
  #   Family.where(employee_id: @employee.id).destroy_all
  #   Experience.where(employee_id: @employee.id).destroy_all
  #   Skillset.where(employee_id: @employee.id).destroy_all
  #   AssignedAsset.where(employee_id: @employee.id).destroy_all
  #   EmployeeSalaryTemplate.where(employee_id: @employee.id).destroy_all
  #   Workingday.where(employee_id: @employee.id).destroy_all
  #   EmployeeTemplate.where(employee_id: @employee.id).destroy_all
  #   ParticularLeaveRecord.where(employee_id: @employee.id).destroy_all
  #   SocietyMemberShip.where(employee_id: @employee.id).destroy_all
  #   MonthlyExpence.where(employee_id: @employee.id).destroy_all
  #   BonusEmployee.where(employee_id: @employee.id).destroy_all
  #   EmployeeShift.where(employee_id: @employee.id).destroy_all
  #   Member.where(employee_id: @employee.id).destroy_all
  #   EmployeeBankDetail.where(employee_id: @employee.id).destroy_all
  #   EmployeePromotion.where(employee_id: @employee.id).destroy_all
  #   TrainingRequest.where(employee_id: @employee.id).destroy_all
  #   InterviewRound.where(employee_id: @employee.id).destroy_all
  #   GoalBunch.where(employee_id: @employee.id).destroy_all
  #   InterviewRoundReschedule.where(employee_id: @employee.id).destroy_all
  #   ManagerHistory.where(employee_id: @employee.id).destroy_all
  #   DueEmployeeDetail.where(employee_id: @employee.id).destroy_all
  #   LeaveRecord.where(employee_id: @employee.id).destroy_all
  #   TravelRequestHistory.where(employee_id: @employee.id).destroy_all
  #   IssueTrackerMember.where(employee_id: @employee.id).destroy_all
  #   TravelRequest.where(employee_id: @employee.id).destroy_all
  #   IssueRequest.where(employee_id: @employee.id).destroy_all
  #   WeekOffMaster.where(employee_id: @employee.id).destroy_all
  #   InductionDetail.where(employee_id: @employee.id).destroy_all
  #   VacancyRequestHistory.where(employee_id: @employee.id).destroy_all
  #   OvertimeSalary.where(employee_id: @employee.id).destroy_all
  #   ReportingMaster.where(employee_id: @employee.id).destroy_all
  #   Trainee.where(employee_id: @employee.id).destroy_all

  #   flash[:notice] = "Employee Record Successfully destroyed !!"
  #   redirect_to destroy_employee_employees_path
  # end

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
    # params.require(:employee).permit(:department_id, :first_name, :middle_name, :last_name, :date_of_birth, :contact_no, :email, :permanent_address, :city, :district, :state, :pin_code, :current_address, :adhar_no, :pan_no, :licence_no, :passport_no, :marital_status, :nationality_id, :blood_group_id, :handicap, :status, :employee_type_id, :gender)
    params.require(:employee).permit(:employee_code_master_id,:manual_employee_code,:company_id, :company_location_id, :department_id, :first_name, :middle_name, :last_name, :date_of_birth, :contact_no, :email, :permanent_address, :city, :country_id, :district_id, :state_id, :pin_code, :current_address, :adhar_no, :pan_no, :licence_no, :passport_no, :marital_status, :nationality_id, :blood_group_id, :handicap, :status, :employee_type_id, :gender, :religion_id, :handicap_type, :cost_center_id)
    # joining_detail_attributes: [:joining_date, :reference_from, :admin_hr, :tech_hr, :designation, :employee_grade_id, :confirmation_date, :status, :probation_period, :notice_period, :medical_schem])
  end
end
