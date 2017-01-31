class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy, :ajax_joining_detail, :ajax_bank_detail, :ajax_qualification_detail, :ajax_new_qualification, :ajax_experience_detail, :ajax_new_experience, :ajax_skillset_detail, :ajax_new_skillset, :ajax_certification_detail, :ajax_new_certification, :ajax_award_detail, :ajax_new_award, :ajax_physical_detail, :ajax_family_detail, :ajax_new_family]
  # load_and_authorize_resource
  # GET /employees
  # GET /employees.json
  def index
    if current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        @employees = Employee.all
      elsif current_user.role.name == 'Admin'
        @employees = Employee.where(company_id: current_user.company_location.company_id)
      elsif current_user.role.name == 'Branch'
        @employees = Employee.where(company_location_id: current_user.company_location_id)
      elsif current_user.role.name == 'HOD'
        @employees = Employee.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Supervisor'
        @emp = Employee.find(current_user.employee_id)
        @employees = @emp.subordinates
      else current_user.role.name == 'Employee'
        @employees = Employee.where(id: current_user.employee_id)
        redirect_to home_index_path
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

    # @company = @employee.company
    # @company_locations = @company.try(:company_locations)
    # @company_location = @employee.company_location
    # @departments = @company_location.try(:departments)

    if current_user.class == Group
    @company_locations = CompanyLocation.all
    else
      if current_user.role.name == 'GroupAdmin'
        @company_locations = CompanyLocation.where(company_id: current_user.company_location.company_id)
        @company_locations.each do |cl|
         @departments = Department.where(company_location_id: cl.id)
        end
      elsif current_user.role.name == 'Admin'
        @company_locations = CompanyLocation.where(company_id: current_user.company_location.company_id)
        @company_locations.each do |cl|
         @departments = Department.where(company_location_id: cl.id)
        end
      elsif current_user.role.name == 'Branch'
        @company_locations = CompanyLocation.where(id: current_user.company_location_id)
        @company_locations.each do |cl|
         @departments = Department.where(company_location_id: cl.id)
        end
     elsif current_user.role.name == 'HOD'
        @company_locations = CompanyLocation.where(id: current_user.company_location_id)
        @company_locations.each do |cl|
         @departments = Department.where(company_location_id: cl.id)
        end
    elsif current_user.role.name == 'Supervisor'
        @company_locations = CompanyLocation.where(id: current_user.company_location_id)
        @company_locations.each do |cl|
         @departments = Department.where(company_location_id: cl.id)
        end
      end
    end
    @form = 'employee'
  end

   

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)
    @department = Department.find(@employee.department_id)
    authorize! :create, @employee
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
      if current_user.role.name == 'GroupAdmin'
        @employees = Employee.joins('LEFT JOIN members on members.employee_id = employees.id where members.employee_id is null')
      elsif current_user.role.name == 'Admin'
        @employees = Employee.joins("LEFT JOIN members on members.employee_id = employees.id where members.employee_id is null and employees.company_id = #{current_user.company_location.company_id}")
      elsif current_user.role.name == 'Branch'
        @employees = Employee.joins("LEFT JOIN members on members.employee_id = employees.id where members.employee_id is null and employees.company_location_id = #{current_user.company_location_id}")
      end
    end
    # @all_employee_list = ReportingMaster.all.collect { |e| [e.try(:employee).try(:manual_employee_code).try(:to_s) + ' ' + e.try(:employee).try(:first_name).try(:to_s) + ' ' + e.try(:employee).try(:last_name).try(:to_s), e.try(:employee).id] }
    # @all_role_list = Role.all.collect { |r| [r.name, r.id] }

   session[:active_tab] ="UserAdministration"
  end

  def submit_form
    @employee_ids = params[:employee_ids]

    role_id = params[:role_id]
    manager_id = params[:manager_id]
    manager_2_id = params[:manager_2_id]

    role = role_id.inject{|n| n}
    final = @employee_ids.zip(role_id,manager_id,manager_2_id)
    final.each do |e,r,m1|
      employee = Employee.find(e)
      if r == ''
        flash[:alert] = 'Select Role'
        redirect_to assign_role_employees_path
      elsif m1 == ''
        flash[:alert] = 'Select Manager 1'
        redirect_to assign_role_employees_path
      else
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
          u.role_id = role
        end
        ActiveRecord::Base.transaction do
          if user.save

            manager_id = params[:manager_id]
            manager_2_id = params[:manager_2_id]

            @manager1 = manager_id.inject{|n| n}
            @manager2 = manager_2_id.inject{|n| n}

            @reporting_master1 = ReportingMaster.find_by(id: @manager1)
            @reporting_master2 = ReportingMaster.find_by(id: @manager2)

            manager_1 = @reporting_master1.employee_id
            manager_2 = @reporting_master2.try(:employee_id)
            employee.update_attributes(manager_id: manager_1, manager_2_id: manager_2)

            ManagerHistory.create(employee_id: employee.id,manager_id: manager_1,manager_2_id: manager_2,effective_from: params["login"]["effec_date"])
            
            flash[:notice] = "Employee assigned successfully."
            redirect_to assign_role_employees_path
            # UserPasswordMailer.welcome_email(company,pass).deliver_now
          else
            p user.errors
            flash[:alert] = 'Employee not assigned successfully.'
            redirect_to assign_role_employees_path
          end
        end
      end #validation
    end #do
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
    @employee = Employee.find(params[:emp_id])
    @employee.manager_id = params[:employee][:manager_id]
    @employee.manager_2_id = params[:employee][:manager_2_id]
    @effec_date = params[:employee][:effec_date]
    
    if @employee.save
      @employees = Employee.where.not(manager_id: nil)
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
    @company_locations = CompanyLocation.all
    else
      if current_user.role.name == 'GroupAdmin'
        @company_locations = CompanyLocation.where(company_id: @company.id)
      elsif current_user.role.name == 'Admin'
        @company_locations = CompanyLocation.where(company_id: current_user.company_location.company_id)
      elsif current_user.role.name == 'Branch'
        @company_locations = CompanyLocation.where(id: current_user.company_location_id)
      elsif current_user.role.name == 'HOD'
        @company_locations = CompanyLocation.where(id: current_user.company_location_id)
      elsif current_user.role.name == 'Supervisor'
        @company_locations = CompanyLocation.where(id: current_user.company_location_id)
      end
    end
    @form = params[:form]
  end

   def collect_company_location_dropdown_with_label
    @company = Company.find(params[:id])
    if current_user.class == Group
    @company_locations = CompanyLocation.all
    else
      if current_user.role.name == 'GroupAdmin'
        @company_locations = CompanyLocation.where(company_id: @company.id)
      elsif current_user.role.name == 'Admin'
        @company_locations = CompanyLocation.where(company_id: current_user.company_location.company_id)
      elsif current_user.role.name == 'Branch'
        @company_locations = CompanyLocation.where(id: current_user.company_location_id)
      elsif current_user.role.name == 'HOD'
        @company_locations = CompanyLocation.where(id: current_user.company_location_id)
      elsif current_user.role.name == 'Supervisor'
        @company_locations = CompanyLocation.where(id: current_user.company_location_id)
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
      if current_user.role.name == 'HOD'
        @departments = Department.where(id: current_user.department_id)
      else
         @departments = Department.where(company_location_id: @company_location.id)
         @form = params[:form]
      end
    
  end

  def basic_info_company_wise
  end


  # def basic_info_company_wise
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

  def member_list_for_update_password
    @members = Member.all
  end

  def reset_password
    @member = Member.find(params[:id])
    @member_password_reset = Member.find_by(manual_member_code: @member.manual_member_code).update(password: "12345678")
    flash[:notice] = "Password Changed Successfully"
    redirect_to member_list_for_update_password_employees_path
  end

  def employee_list_report
      if current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        @employees = Employee.all
      elsif current_user.role.name == 'Admin'
        @employees = Employee.where(company_id: current_user.company_location.company_id)
      elsif current_user.role.name == 'Branch'
        @employees = Employee.where(company_location_id: current_user.company_location_id)
      elsif current_user.role.name == 'HOD'
        @employees = Employee.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Supervisor'
        @emp = Employee.find(current_user.employee_id)
        @employees = @emp.subordinates
      else current_user.role.name == 'Employee'
        @employees = Employee.where(id: current_user.employee_id)
      end
    else
       @employees = Employee.where(id: current_user.employee_id)
        @employees = []
    if @employee_id.nil? || employee_id.empty?
      flash[:alert] = "Please Select the checkbox"
      redirect_to employee_list_report_employees_path
    else

    end
    end
      session[:active_tab] ="EmployeeManagement"
      session[:active_tab1] ="Reports"
  end

  def selected_employee_list_report
    @employee_id = params[:employee_id]
    @employees = Employee.where(id: @employee_id)
    if @employee_id.nil?
      flash[:alert] = "Please Select the checkbox"
      @employees = []
      redirect_to selected_employee_list_report_employees_path
    else
    end
    @employees = Employee.where(id: @employee_id)     
  end

  def selected_employee_pdf

      @employee_id = params[:employee_id]
      @employee_id.each do |e|
      @employee = Employee.find_by(id: e)
      @employees = Employee.where(id: e)
    end
    #@employee_template = EmployeeTemplate.find(params[:employee_template_id])
    #@employee_salary_templates = EmployeeSalaryTemplate.where(employee_id: @employee_template.employee_id,salary_template_id: @employee_template.salary_template_id)    
    respond_to do |format|
      format.json
      format.pdf do
        render pdf: 'employee',
              layout: 'pdf.html',
              orientation: 'Landscape',
              template: 'employees/selected_employee_pdf.pdf.erb',
              show_as_html: params[:debug].present?,
              margin:  { top:10,bottom:10,left:20,right:20 }
      end
    end
  end

  def selected_employee_xls
     @employee_id = params[:employee_id]
      @employees = Employee.where(id: @employee_id)
      @employee_id.each do |e|
        @employee = Employee.find_by(id: e)
      end
    respond_to do |format|
      format.xls {render template: 'employees/selected_employee_xls.xls.erb'}
    end
  end

def selected_on_boarding_pdf
      @employee_id = params[:employee_id]
      @joining_details = JoiningDetail.where(employee_id: @employee_id)
      @employee_id.each do |e|
      @employee = Employee.find_by(id: e)
      @employees = Employee.where(id: e)
    end
    #@employee_template = EmployeeTemplate.find(params[:employee_template_id])
    #@employee_salary_templates = EmployeeSalaryTemplate.where(employee_id: @employee_template.employee_id,salary_template_id: @employee_template.salary_template_id)    
    respond_to do |format|
      format.json
      format.pdf do
        render pdf: 'employee',
              layout: 'pdf.html',
              orientation: 'Landscape',
              template: 'employees/selected_on_boarding_pdf.pdf.erb',
              show_as_html: params[:debug].present?,
              margin:  { top:10,bottom:10,left:20,right:20 }
      end
    end
end

  def selected_on_boarding_xls
    @employee_id = params[:employee_id]
    @joining_details = JoiningDetail.where(employee_id: @employee_id)
      @employee_id.each do |e|
        @employee = Employee.find_by(id: e)
      end
    respond_to do |format|
      format.xls {render template: 'employees/selected_on_boarding_xls.xls.erb'}
    end
  end


def selected_bank_pdf
   @employee_id = params[:employee_id]
      @employee_bank_details = EmployeeBankDetail.where(employee_id: @employee_id)
      @employee_id.each do |e|
      @employee = Employee.find_by(id: e)
    end
    #@employee_template = EmployeeTemplate.find(params[:employee_template_id])
    #@employee_salary_templates = EmployeeSalaryTemplate.where(employee_id: @employee_template.employee_id,salary_template_id: @employee_template.salary_template_id)    
    respond_to do |format|
      format.json
      format.pdf do
        render pdf: 'employee',
              layout: 'pdf.html',
              orientation: 'Landscape',
              template: 'employees/selected_bank_pdf.pdf.erb',
              show_as_html: params[:debug].present?,
              margin:  { top:10,bottom:10,left:20,right:20 }
      end
    end
end

def selected_bank_xls
   @employee_id = params[:employee_id]
    @employee_bank_details = EmployeeBankDetail.where(employee_id: @employee_id)
      @employee_id.each do |e|
        @employee = Employee.find_by(id: e)
      end
    respond_to do |format|
      format.xls {render template: 'employees/selected_bank_xls.xls.erb'}
    end
end

def selected_qualification_pdf
   @employee_id = params[:employee_id]
      @qualifications = Qualification.where(employee_id: @employee_id)
      @employee_id.each do |e|
      @employee = Employee.find_by(id: e)
    end
    #@employee_template = EmployeeTemplate.find(params[:employee_template_id])
    #@employee_salary_templates = EmployeeSalaryTemplate.where(employee_id: @employee_template.employee_id,salary_template_id: @employee_template.salary_template_id)    
    respond_to do |format|
      format.json
      format.pdf do
        render pdf: 'employee',
              layout: 'pdf.html',
              orientation: 'Landscape',
              template: 'employees/selected_qualification_pdf.pdf.erb',
              show_as_html: params[:debug].present?,
              margin:  { top:10,bottom:10,left:20,right:20 }
      end
    end
  
end

def selected_qualification_xls
    @employee_id = params[:employee_id]
    @qualifications = Qualification.where(employee_id: @employee_id)
      @employee_id.each do |e|
        @employee = Employee.find_by(id: e)
      end
    respond_to do |format|
      format.xls {render template: 'employees/selected_qualification_xls.xls.erb'}
    end
  end

def selected_experience_pdf
      @employee_id = params[:employee_id]
      @experiences = Experience.where(employee_id: @employee_id)
      @employee_id.each do |e|
      @employee = Employee.find_by(id: e)
    end
    #@employee_template = EmployeeTemplate.find(params[:employee_template_id])
    #@employee_salary_templates = EmployeeSalaryTemplate.where(employee_id: @employee_template.employee_id,salary_template_id: @employee_template.salary_template_id)    
    respond_to do |format|
      format.json
      format.pdf do
        render pdf: 'employee',
              layout: 'pdf.html',
              orientation: 'Landscape',
              template: 'employees/selected_experience_pdf.pdf.erb',
              show_as_html: params[:debug].present?,
              margin:  { top:10,bottom:10,left:20,right:20 }
      end
    end
end

def selected_experience_xls
   @employee_id = params[:employee_id]
    @experiences = Experience.where(employee_id: @employee_id)
      @employee_id.each do |e|
        @employee = Employee.find_by(id: e)
      end
    respond_to do |format|
      format.xls {render template: 'employees/selected_experience_xls.xls.erb'}
    end
end

def selected_skillset_pdf
     @employee_id = params[:employee_id]
      @skillsets = Skillset.where(employee_id: @employee_id)
      @employee_id.each do |e|
      @employee = Employee.find_by(id: e)
    end
    #@employee_template = EmployeeTemplate.find(params[:employee_template_id])
    #@employee_salary_templates = EmployeeSalaryTemplate.where(employee_id: @employee_template.employee_id,salary_template_id: @employee_template.salary_template_id)    
    respond_to do |format|
      format.json
      format.pdf do
        render pdf: 'employee',
              layout: 'pdf.html',
              orientation: 'Landscape',
              template: 'employees/selected_skillset_pdf.pdf.erb',
              show_as_html: params[:debug].present?,
              margin:  { top:10,bottom:10,left:20,right:20 }
      end
    end
  
end

def selected_skillset_xls
  @employee_id = params[:employee_id]
    @skillsets = Skillset.where(employee_id: @employee_id)
      @employee_id.each do |e|
        @employee = Employee.find_by(id: e)
      end
    respond_to do |format|
      format.xls {render template: 'employees/selected_skillset_xls.xls.erb'}
    end
end

def selected_certification_pdf
  @employee_id = params[:employee_id]
      @certifications = Certification.where(employee_id: @employee_id)
      @employee_id.each do |e|
      @employee = Employee.find_by(id: e)
    end
    #@employee_template = EmployeeTemplate.find(params[:employee_template_id])
    #@employee_salary_templates = EmployeeSalaryTemplate.where(employee_id: @employee_template.employee_id,salary_template_id: @employee_template.salary_template_id)    
    respond_to do |format|
      format.json
      format.pdf do
        render pdf: 'employee',
              layout: 'pdf.html',
              orientation: 'Landscape',
              template: 'employees/selected_certification_pdf.pdf.erb',
              show_as_html: params[:debug].present?,
              margin:  { top:10,bottom:10,left:20,right:20 }
      end
    end
end

def selected_certification_xls
  @employee_id = params[:employee_id]
    @certifications = Certification.where(employee_id: @employee_id)
      @employee_id.each do |e|
        @employee = Employee.find_by(id: e)
      end
    respond_to do |format|
      format.xls {render template: 'employees/selected_certification_xls.xls.erb'}
    end
end

def selected_award_pdf
      @employee_id = params[:employee_id]
      @awards = Award.where(employee_id: @employee_id)
      @employee_id.each do |e|
      @employee = Employee.find_by(id: e)
    end
    #@employee_template = EmployeeTemplate.find(params[:employee_template_id])
    #@employee_salary_templates = EmployeeSalaryTemplate.where(employee_id: @employee_template.employee_id,salary_template_id: @employee_template.salary_template_id)    
    respond_to do |format|
      format.json
      format.pdf do
        render pdf: 'employee',
              layout: 'pdf.html',
              orientation: 'Landscape',
              template: 'employees/selected_award_pdf.pdf.erb',
              show_as_html: params[:debug].present?,
              margin:  { top:10,bottom:10,left:20,right:20 }
      end
    end
end

def selected_award_xls
  @employee_id = params[:employee_id]
    @awards = Award.where(employee_id: @employee_id)
      @employee_id.each do |e|
        @employee = Employee.find_by(id: e)
      end
    respond_to do |format|
      format.xls {render template: 'employees/selected_award_xls.xls.erb'}
    end
end

def selected_employee_physical_pdf
      @employee_id = params[:employee_id]
      @employee_physicals = EmployeePhysical.where(employee_id: @employee_id)
      @employee_id.each do |e|
      @employee = Employee.find_by(id: e)
    end
    #@employee_template = EmployeeTemplate.find(params[:employee_template_id])
    #@employee_salary_templates = EmployeeSalaryTemplate.where(employee_id: @employee_template.employee_id,salary_template_id: @employee_template.salary_template_id)    
    respond_to do |format|
      format.json
      format.pdf do
        render pdf: 'employee',
              layout: 'pdf.html',
              orientation: 'Landscape',
              template: 'employees/selected_employee_physical_pdf.pdf.erb',
              show_as_html: params[:debug].present?,
              margin:  { top:10,bottom:10,left:20,right:20 }
      end
    end
end

def selected_employee_physical_xls
  @employee_id = params[:employee_id]
    @employee_physicals = EmployeePhysical.where(employee_id: @employee_id)
      @employee_id.each do |e|
        @employee = Employee.find_by(id: e)
      end
    respond_to do |format|
      format.xls {render template: 'employees/selected_employee_physical_xls.xls.erb'}
    end
end

def selected_employee_family_pdf
      @employee_id = params[:employee_id]
      @families = Family.where(employee_id: @employee_id)
      @employee_id.each do |e|
      @employee = Employee.find_by(id: e)
    end
    #@employee_template = EmployeeTemplate.find(params[:employee_template_id])
    #@employee_salary_templates = EmployeeSalaryTemplate.where(employee_id: @employee_template.employee_id,salary_template_id: @employee_template.salary_template_id)    
    respond_to do |format|
      format.json
      format.pdf do
        render pdf: 'employee',
              layout: 'pdf.html',
              orientation: 'Landscape',
              template: 'employees/selected_employee_family_pdf.pdf.erb',
              show_as_html: params[:debug].present?,
              margin:  { top:10,bottom:10,left:20,right:20 }
      end
    end
end

def selected_employee_family_xls
  @employee_id = params[:employee_id]
    @families = Family.where(employee_id: @employee_id)
      @employee_id.each do |e|
        @employee = Employee.find_by(id: e)
      end
    respond_to do |format|
      format.xls {render template: 'employees/selected_employee_family_xls.xls.erb'}
    end
end

def selected_employee_nomination_pdf
      @employee_id = params[:employee_id]
      @employee_nominations = EmployeeNomination.where(employee_id: @employee_id)
      @employee_id.each do |e|
      @employee = Employee.find_by(id: e)
    end
    #@employee_template = EmployeeTemplate.find(params[:employee_template_id])
    #@employee_salary_templates = EmployeeSalaryTemplate.where(employee_id: @employee_template.employee_id,salary_template_id: @employee_template.salary_template_id)    
    respond_to do |format|
      format.json
      format.pdf do
        render pdf: 'employee',
              layout: 'pdf.html',
              orientation: 'Landscape',
              template: 'employees/selected_employee_nomination_pdf.pdf.erb',
              show_as_html: params[:debug].present?,
              margin:  { top:10,bottom:10,left:20,right:20 }
      end
    end
end

def selected_employee_nomination_xls
  @employee_id = params[:employee_id]
    @employee_nominations = EmployeeNomination.where(employee_id: @employee_id)
      @employee_id.each do |e|
        @employee = Employee.find_by(id: e)
      end
    respond_to do |format|
      format.xls {render template: 'employees/selected_employee_nomination_xls.xls.erb'}
    end
end

def selected_asset_pdf
      @employee_id = params[:employee_id]
      @assigned_assets = AssignedAsset.where(employee_id: @employee_id)
      @employee_id.each do |e|
      @employee = Employee.find_by(id: e)
    end
    #@employee_template = EmployeeTemplate.find(params[:employee_template_id])
    #@employee_salary_templates = EmployeeSalaryTemplate.where(employee_id: @employee_template.employee_id,salary_template_id: @employee_template.salary_template_id)    
    respond_to do |format|
      format.json
      format.pdf do
        render pdf: 'employee',
              layout: 'pdf.html',
              orientation: 'Landscape',
              template: 'employees/selected_asset_pdf.pdf.erb',
              show_as_html: params[:debug].present?,
              margin:  { top:10,bottom:10,left:20,right:20 }
      end
    end
end

def selected_asset_xls
  @employee_id = params[:employee_id]
    @assigned_assets = AssignedAsset.where(employee_id: @employee_id)
      @employee_id.each do |e|
        @employee = Employee.find_by(id: e)
      end
    respond_to do |format|
      format.xls {render template: 'employees/selected_asset_xls.xls.erb'}
    end
end

def all_employee_list
  @employees = Employee.all
end

def dynamic_report
    @employee_type = params[:employee][:employee_type_id]
    @company = params[:employee][:company_id]
    @location = params[:food_deduction][:company_location_id]
    if current_user.class == Group
      if @location == ""
        @employees = Employee.where(employee_type_id: @employee_type,company_id: @company.to_i)
        else 
        @employees = Employee.where(employee_type_id: @employee_type,company_id: @company.to_i,company_location_id: @location.to_i)
        end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @location == ""
        @employees = Employee.where(employee_type_id: @employee_type,company_id: @company.to_i)
        else 
        @employees = Employee.where(employee_type_id: @employee_type,company_id: @company.to_i,company_location_id: @location.to_i)
        end
       elsif current_user.role.name == 'Admin'
        if @location == ""
        @employees = Employee.where(employee_type_id: @employee_type,company_id: @company.to_i)
        else 
        @employees = Employee.where(employee_type_id: @employee_type,company_id: @company.to_i,company_location_id: @location.to_i)
        end
        elsif current_user.role.name == 'Branch'
        if @location == ""
        @employees = Employee.where(employee_type_id: @employee_type,company_id: @company.to_i)
        else 
        @employees = Employee.where(employee_type_id: @employee_type,company_id: @company.to_i,company_location_id: @location.to_i)
        end
      elsif current_user.role.name == 'HOD'
        @employees = Employee.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
    end
end

def left_employee_xl
    @employee_type = params[:employee_type_id]
    @company = params[:company_id]
    @location = params[:company_location_id]
    if current_user.class == Group
      if @location == ""
        @employees = Employee.where(employee_type_id: @employee_type,company_id: @company.to_i)
        else 
        @employees = Employee.where(employee_type_id: @employee_type,company_id: @company.to_i,company_location_id: @location.to_i)
        end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @location == ""
        @employees = Employee.where(employee_type_id: @employee_type,company_id: @company.to_i)
        else 
        @employees = Employee.where(employee_type_id: @employee_type,company_id: @company.to_i,company_location_id: @location.to_i)
        end
       elsif current_user.role.name == 'Admin'
        if @location == ""
        @employees = Employee.where(employee_type_id: @employee_type,company_id: @company.to_i)
        else 
        @employees = Employee.where(employee_type_id: @employee_type,company_id: @company.to_i,company_location_id: @location.to_i)
        end
        elsif current_user.role.name == 'Branch'
        if @location == ""
        @employees = Employee.where(employee_type_id: @employee_type,company_id: @company.to_i)
        else 
        @employees = Employee.where(employee_type_id: @employee_type,company_id: @company.to_i,company_location_id: @location.to_i)
        end
      elsif current_user.role.name == 'HOD'
        @employees = Employee.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
    end
    respond_to do |format|
      format.xls {render template: 'employees/left_employee.xls.erb'}
    end
end

def left_employee_pdf
    @employee_type = params[:employee_type_id]
    @company = params[:company_id]
    @location = params[:company_location_id]
    if current_user.class == Group
      if @location == ""
        @employees = Employee.where(employee_type_id: @employee_type,company_id: @company.to_i)
        else 
        @employees = Employee.where(employee_type_id: @employee_type,company_id: @company.to_i,company_location_id: @location.to_i)
        end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @location == ""
        @employees = Employee.where(employee_type_id: @employee_type,company_id: @company.to_i)
        else 
        @employees = Employee.where(employee_type_id: @employee_type,company_id: @company.to_i,company_location_id: @location.to_i)
        end
       elsif current_user.role.name == 'Admin'
        if @location == ""
        @employees = Employee.where(employee_type_id: @employee_type,company_id: @company.to_i)
        else 
        @employees = Employee.where(employee_type_id: @employee_type,company_id: @company.to_i,company_location_id: @location.to_i)
        end
        elsif current_user.role.name == 'Branch'
        if @location == ""
        @employees = Employee.where(employee_type_id: @employee_type,company_id: @company.to_i)
        else 
        @employees = Employee.where(employee_type_id: @employee_type,company_id: @company.to_i,company_location_id: @location.to_i)
        end
      elsif current_user.role.name == 'HOD'
        @employees = Employee.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
    end
    respond_to do |format|
          format.json
          format.pdf do
            render pdf: 'left_employee_pdf',
                  layout: 'pdf.html',
                  orientation: 'Landscape',
                  template: 'employees/left_employee.pdf.erb',
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

  # def destroy_details
  #   @employee = Employee.find(params[:emp_id])

    # @employee = Employee.find(params[:emp_id])
    # Employee.find_by(id: @employee.id).destroy
    # JoiningDetail.where(employee_id: @employee.id).destroy_all
    # Salaryslip.where(employee_id: @employee.id).destroy_all
    # EmployeeNomination.where(employee_id: @employee.id).destroy_all
    # Award.where(employee_id: @employee.id).destroy_all
    # Certification.where(employee_id: @employee.id).destroy_all
    # InterviewSchedule.where(employee_id: @employee.id).destroy_all
    # VacancyMaster.where(employee_id: @employee.id).destroy_all
    # Qualification.where(employee_id: @employee.id).destroy_all
    # EmployeeLeavRequest.where(employee_id: @employee.id).destroy_all
    # EmployeeLeavBalance.where(employee_id: @employee.id).destroy_all
    # Family.where(employee_id: @employee.id).destroy_all
    # Experience.where(employee_id: @employee.id).destroy_all
    # Skillset.where(employee_id: @employee.id).destroy_all
    # AssignedAsset.where(employee_id: @employee.id).destroy_all
    # EmployeeSalaryTemplate.where(employee_id: @employee.id).destroy_all
    # Workingday.where(employee_id: @employee.id).destroy_all
    # EmployeeTemplate.where(employee_id: @employee.id).destroy_all
    # ParticularLeaveRecord.where(employee_id: @employee.id).destroy_all
    # SocietyMemberShip.where(employee_id: @employee.id).destroy_all
    # MonthlyExpence.where(employee_id: @employee.id).destroy_all
    # BonusEmployee.where(employee_id: @employee.id).destroy_all
    # EmployeeShift.where(employee_id: @employee.id).destroy_all
    # Member.where(employee_id: @employee.id).destroy_all
    # EmployeeBankDetail.where(employee_id: @employee.id).destroy_all
    # EmployeePromotion.where(employee_id: @employee.id).destroy_all
    # TrainingRequest.where(employee_id: @employee.id).destroy_all
    # InterviewRound.where(employee_id: @employee.id).destroy_all
    # GoalBunch.where(employee_id: @employee.id).destroy_all
    # InterviewRoundReschedule.where(employee_id: @employee.id).destroy_all
    # ManagerHistory.where(employee_id: @employee.id).destroy_all
    # DueEmployeeDetail.where(employee_id: @employee.id).destroy_all
    # LeaveRecord.where(employee_id: @employee.id).destroy_all
    # TravelRequestHistory.where(employee_id: @employee.id).destroy_all
    # TravelRequest.where(employee_id: @employee.id).destroy_all
    # IssueRequest.where(employee_id: @employee.id).destroy_all
    # WeekOffMaster.where(employee_id: @employee.id).destroy_all
    # InductionDetail.where(employee_id: @employee.id).destroy_all
    # VacancyRequestHistory.where(employee_id: @employee.id).destroy_all
    # OvertimeSalary.where(employee_id: @employee.id).destroy_all
    # ReportingMaster.where(employee_id: @employee.id).destroy_all
    # Trainee.where(employee_id: @employee.id).destroy_all
# --------------------------------------------------------------------------------------------------------------
#     @issue_tracker_members = IssueTrackerMember.where(employee_id: @employee.id)
#     @issue_tracker_members.each do |itm|
#     IssueRequest.where(issue_tracker_member_id: itm.id).destroy_all
#     IssueHistory.where(issue_tracker_member_id: itm.id).destroy_all
#     IssueLocker.where(issue_tracker_member_id: itm.id).destroy_all
#     IssueLockerHistory.where(issue_tracker_member_id: itm.id).destroy_all
#     IssueTrackerMember.where(employee_id: @employee.id).destroy_all

#     end

#     @issue_requests = IssueRequest.where(employee_id: @employee.id)
#     @issue_requests.each do |ir|
#     IssueHistory.where(issue_request_id: ir.id).destroy_all
#     IssueLocker.where(issue_request_id: ir.id).destroy_all
#     IssueLockerHistory.where(issue_request_id: ir.id).destroy_all 
#     IssueRequest.where(id: ir.id).destroy_all
#     end

#     @salaryslips= Salaryslip.where(employee_id: @employee.id)
#     salaryslips.each do |ss|
#       SalaryslipComponent.where(salaryslip_id: ss.id)
#       Salaryslip.where(id: ss.idss)
#     end

    # @goal_bunches = GoalBunch.where(employee_id: @employee.id)
    # @goal_bunches.each do |gb|

    #   GoalRating.where(goal_bunch_id: gb.id).destroy_all
    #   GoalRating.where(appraisee_id: gb.id).destroy_all
    #   GoalRating.where(appraiser_id: gb.id).destroy_all
    #   GoalRating.where(reviewer_id: gb.id).destroy_all
    #   GoalRating.where(goal_bunch_id: gb.id).destroy_all

    #   GoalBunch.where(id: gb.id).destroy_all
    #   GoalBunch.where(employee_id: gb.id).destroy_all
    #   GoalBunch.where(appraisee_id: gb.id).destroy_all
    #   GoalBunch.where(appraiser_id: gb.id).destroy_all
    #   GoalBunch.where(reviewer_id: gb.id).destroy_all
    #   GoalBunch.where(final_id: gb.id).destroy_all
    # end
    

# -------------------------------------------------------------------------------------------
   

    # @employee_resignations = EmployeeResignation.where(employee_id: @employee.id)
    # @employee_resignations.each do |er|
    # ResignationHistory.where(employee_resignation_id: er.id).destroy_all
    # DueEmployeeDetail.where(employee_id: er.id).destroy_all
    # DueEmployeeTemplate.where(employee_id: @employee.id,due_template_id: @due_template.id).destroy_all
    # DueDetail.where(due_employee_template_id: @due_employee_template.id).destroy_all
    # EmployeeResignation.where(employee_id: @employee.id).destroy_all
    # ExitInterview.where(employee_id: @employee.id).destroy_all
    
    # AdvanceSalary.where(employee_id: @employee_id).destroy_all
    # Instalment.where(advance_salary_id: @advance_salary.id).destroy_all

    # Attendance.where(employee_id: @employee.id).destroy_all
    # EmployeeShift.where(employee_id: @employee.id).destroy_all


  #   @workingdays = Workingday.where(employee_id: @employee.id)
  #   @workingdays.each do |w|
    
  #   Salaryslip.where(workingday_id: w.id).destroy_all
  #   Workingday.where(id: w.id).destroy_all
  # end
  # EmployeeBankDetail.where(employee_id: @employee.id).destroy_all
  # Workingday.where(employee_id: @employee.id).destroy_all
  # EmployeeTemplate.where(employee_id: @employee.id).destroy_all
  
  #   @employee_arrears = EmployeeArrear.where(employee_id: @employee.id)
  #   @employee_arrears.each do |a|

  #   EmployeeArrear.where(employee_id: a.id).destroy_all
  #   EmployeeArrearItem.where(employee_arrear_id: a.id).destroy_all
  #   EmployeeArrear.where(employee_id: @employee.id).destroy_all

  # end
  #  EmployeeSalaryTemplate.where(employee_id: @employee.id).destroy_all

    # SalaryslipComponent.where(salaryslip_id: @salaryslip.id).destroy_all
   
    # SalaryComponentTemplate.where(salary_template: @salary_template.id).destroy_all
   
    
    # SalaryCompMapping.where(salary_component_id: @salary_component.id).destroy_all

# --------------------------------------------------------------------------------------------------------------------
#     @vacancy_masters = VacancyMaster.where(employee_id: @employee.id)
#     @vacancy_masters.each do |vm|
  
#     VacancyRequestHistory.where(vacancy_master_id: vm.id).destroy_all
#     ParticularVacancyRequest.where(employee_id: @employee.id).destroy_all
#     ReportingMastersVacancyMaster.where(vacancy_master_id: vm.id).destroy_all
#     VacancyMaster.where(employee_id: @employee.id).destroy_all
# end
#     @interview_schedules = InterviewSchedule.where(employee_id: @employee.id)
#     @interview_schedules.each do |is|
    
#     InterviewRound.where(interview_schedule_id: is.id).destroy_all
#     InterviewAnalysis.where(interview_schedule_id: is.id).destroy_all
#     InterviewSchedule.where(id: is.id).destroy_all
#     InterviewRoundReschedule.where(employee_id: @employee.id).destroy_all

# end


# -------------------------------------------------------------------------------------------------------------

    # @training_requests = TrainingRequest.where(employee_id: @employee.id)
    # @training_requests.each do |tr|
    # TraineeRequest.where(training_request_id: tr.id).destroy_all
    # TrainingApproval.where(training_request_id: tr.id).destroy_all
    # TrainingRequest.where(employee_id: @employee.id).destroy_all 
    # end
    # TrainingRequest.where(employee_id: @employee.id).destroy_all
    # TraineeRequest.where(employee_id: @employee.id).destroy_all
    # TrainingApproval.where(employee_id: @employee.id).destroy_all
    # Trainee.where(employee_id: @employee.id).destroy_all

    # @advance_salaries = AdvanceSalary.where(employee_id: @employee.id)
    # @advance_salaries.each do |as|
    #   Instalment.where(advance_salary_id: as.id).destroy_all
    #   AdvanceSalary.where(employee_id: @employee.id).destroy_all
    # end

    # @employee_leav_requests = EmployeeLeavRequest.where(employee_id: @employee.id)
    # @employee_leav_requests.each do |elr|
    #   ParticularLeaveRecord.where(employee_leav_request_id: elr.id).destroy_all
    #   LeaveRecord.where(employee_leav_request_id: elr.id).destroy_all
    #   LeaveStatusRecord.where(employee_leav_request_id: elr.id).destroy_all
    #   EmployeeLeavRequest.where(id: elr.id).destroy_all
    # end
    #  EmployeeLeavBalance.where(employee_id: @employee.id).destroy_all
    #  LeaveCOff.where(employee_id: @employee.id).destroy_all


    # @travel_requests = TravelRequest.where(employee_id: @employee.id)
    # @travel_requests.each do |travel|
    #   ReportingMastersTravelRequest.where(travel_request_id: travel.id).destroy_all
    #   TravelRequestHistory.where(travel_request_id: travel.id).destroy_all
    #   TravelExpence.where(travel_request_id: travel.id).destroy_all
    #   DailyBillDetail.where(travel_request_id: travel.id).destroy_all
    # end
    # TravelRequest.where(employee_id: @employee.id).destroy_all

    #  MonthlyExpence.whre(employee_id: @employee.id).destroy_all


  #   TransferHistory.where(employee_id: @employee.id).destroy_all
  #   EmployeeTransfer.where(employee_id: @employee.id).destroy_all

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
    params.require(:employee).permit(:employee_code_master_id,:prefix,:passport_photo,:manual_employee_code,:company_id, :company_location_id, :department_id, :first_name, :middle_name, :last_name, :date_of_birth, :contact_no, :email, :permanent_address, :city, :country_id, :district_id, :state_id, :pin_code, :current_address, :adhar_no, :pan_no, :licence_no, :passport_no, :marital_status, :nationality_id, :blood_group_id, :handicap, :status, :employee_type_id, :gender, :religion_id, :handicap_type, :cost_center_id)
    # joining_detail_attributes: [:joining_date, :reference_from, :admin_hr, :tech_hr, :designation, :employee_grade_id, :confirmation_date, :status, :probation_period, :notice_period, :medical_schem])
  end
end