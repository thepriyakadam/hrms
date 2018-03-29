class Employee < ActiveRecord::Base
  has_many :employee_attendences

  protokoll :employee_code, pattern: 'EMP#######'
  belongs_to :department
  belongs_to :sub_department
  belongs_to :company_location
  belongs_to :company
  belongs_to :sub_department
  belongs_to :nationality
  belongs_to :blood_group
  belongs_to :employee_type
  belongs_to :country
  belongs_to :state
  belongs_to :district
  belongs_to :religion
  belongs_to :employee_code_master
  belongs_to :service_master
  belongs_to :resource_pool_master
  belongs_to :cost_center
  # has_many :employee_resignations
  has_many :trainees
  has_many :gps_dailies
  has_many :exit_interviews

  has_many :reporting_masters
  has_many :employee_attendances
  has_many :leave_c_offs
  has_many :salaryslips
  has_many :employee_nominations
  has_many :awards
  has_many :certifications
  has_many :interview_schedules
  #has_many :vacancy_masters
  has_many :interview_reschedules
  has_many :qualifications
  has_many :employee_leav_requests
  has_many :reimbursement_requests
  has_many :memberships
  has_many :recruiters
  has_many :selected_resumes, class_name: "Employee",foreign_key: "add_by_id"
  has_many :vacancy_masters, class_name: "Employee",foreign_key: "recruiter_id"
  has_many :vacancy_masters, class_name: "Employee",foreign_key: "replacement_id"

  #has_many :vacancy_masters,class_name: 'Employee',foreign_key: 'recruiter_id'
  has_many :reporting_masters, class_name: 'ReportingMaster', foreign_key: 'reporting_master_id'
  
  # has_many :first_reporters, :class_name => "EmployeeLeavRequest", :foreign_key => :first_reporter_id
  # has_many :second_reporters, :class_name => "EmployeeLeavRequest", :foreign_key => :second_reporter_id
  has_many :reporting_masters, class_name: 'Employee', foreign_key: 'reporting_master_id'
  #has_many :replacements, class_name: 'Employee', foreign_key: 'replacement_id'
  has_many :first_reporters, class_name: 'EmployeeLeavRequest', foreign_key: 'first_reporter_id'
  has_many :second_reporters, class_name: 'EmployeeLeavRequest', foreign_key: 'second_reporter_id'
  has_many :change_status_employees, class_name: 'LeaveStatusRecord', foreign_key: 'change_status_employee_id'
  has_many :employee_leav_balances
  has_many :overtime_salaries
  has_many :vacancy_request_histories
  has_many :induction_details
  # accepts_nested_attributes_for :employee_leav_balances
  has_many :families
  has_many :experiences
  has_many :skillsets
  has_many :assigned_assets
  has_many :employee_salary_templates
  has_many :workingdays
  has_many :employee_templates
  has_many :particular_leave_records
  has_many :society_member_ships
  has_many :monthly_expences
  has_many :bonus_employees
  has_one :employee_shift
  has_one :member
  has_one :employee_bank_detail
  has_one :joining_detail
  has_many :training_requests
  has_many :goal_bunches
  has_many :employee_documents
  has_many :interview_rounds
  has_many :interview_round_reschedules
  has_many :manager_histories
  has_many :due_employee_details
  has_many :employee_promotions
  has_many :promotion_histories
  has_many :leave_records
  has_many :travel_request_histories
  has_many :issue_tracker_members
  has_many :issue_tracker_accesses
  has_many :daily_bill_details
  has_many :travel_requests
  has_many :issue_requests
  has_many :issue_lockers
  has_many :week_off_masters
  has_many :machine_attendances
  has_many :on_duty_requests
  has_many :gratuity
  has_many :texable_monthly_deductions
  has_many :advance_salaries
  has_many :employee_jc_lists
  has_many :rembursments
  has_many :status_c_offs
  has_many :leave_transfers

  has_many :leave_transfers, class_name: "Employee",
                          foreign_key: "transfer_to_id"

  #accepts_nested_attributes_for :joining_detail
  has_many :subordinates, class_name: 'Employee',
                          foreign_key: 'manager_id'
  belongs_to :manager, class_name: 'Employee'

  has_many :indirect_subordinates, class_name: 'Employee',
                                   foreign_key: 'manager_2_id'
  belongs_to :manager_2, class_name: 'Employee'

  has_many :goal_ratings, class_name: "Employee",
                          foreign_key: "appraiser_id"

  has_many :goal_ratings, class_name: "Employee",
                          foreign_key: "appraisee_id"

  has_many :goal_ratings, class_name: "Employee",
                          foreign_key: "reviewer_id"

  has_many :manager_histories, class_name: "Employee",
                          foreign_key: "manager_id"
  has_many :manager_histories, class_name: "Employee",
                          foreign_key: "manager_2_id"

  has_many :on_duty_requests, class_name: "Employee",
                          foreign_key: "first_reporter_id"

  has_many :on_duty_requests, class_name: "Employee",
                          foreign_key: "second_reporter_id"

  has_many :reimbursement_requests, class_name: "Employee",
                          foreign_key: "approval_id"
                          
  belongs_to :user, class_name: 'Employee'

  has_many :second_reporters, class_name: 'EmployeeResignation', foreign_key: 'second_reporter_id'
  has_many :resignation_status_records, class_name: 'ResignationStatusRecord', foreign_key: 'change_status_employee_id'
  has_many :second_reporters, class_name: 'EmployeeResignation', foreign_key: 'final_reporter_id'
  has_many :replacements, class_name: 'JoiningDetail', foreign_key: 'replacement_id'
  has_many :vacancy_requests, class_name: 'Employee', foreign_key: 'request_by_id'
  has_many :vacancy_requests, class_name: 'Employee', foreign_key: 'approval_by_id'
  has_many :candidate_forms, class_name: 'Employee', foreign_key: 'selected_by_id'
  has_many :candidate_interview_schedules, class_name: 'Employee', foreign_key: 'interviewer_id'
  has_many :greetings, class_name: "Employee", foreign_key: "sender_id"
  has_many :greetings, class_name: "Employee", foreign_key: "receiver_id"
  has_many :loan_requests, class_name: "Employee", foreign_key: "request_to_id"
  has_many :loan_approvals, class_name: "Membership", foreign_key: "approval_id"
  has_many :change_designations
  has_many :change_designations, class_name: "Employee", foreign_key: "change_by_id"
  has_many :frequest_questions
  has_many :contact_details


  # has_many :reporting_masters, class_name: "Employee",
  #                         foreign_key: "manager_id"

  # has_many :reporting_masters, class_name: "Employee",
  #                         foreign_key: "manager_2_id"

  # before_create :add_department
  # before_update :add_department

  validates :manual_employee_code, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :email, presence: true

  has_attached_file :passport_photo, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: 'Profile11.jpg'
  validates_attachment_content_type :passport_photo,  :content_type => /\Aimage\/.*\Z/,:message => 'only (png/gif/jpeg) images'
  validates_attachment_size :passport_photo, :less_than => 5.megabytes


  # has_attached_file :employee_signature, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: 'Profile11.jpg'
  # validates_attachment_content_type :employee_signature,  :content_type => /\Aimage\/.*\Z/,:message => 'only (png/gif/jpeg) images'
  # validates_attachment_size :employee_signature, :less_than => 5.megabytes
  
  # validates :permanent_address, presence: true
  # validates :department_id,presence: true
  
  # validate :adhar_no_regex
  # validate :pan_no_regex

  def adhar_no_regex
    if adhar_no.present? && !adhar_no.match(/[0-9]{12}/)
      errors.add :adhar_no, 'Please specify Correct Adhar Number'
    end
  end

  def email_regex
    if email.present? && !email.match(/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.(com|net|org|info|com.au|in|in.co|))?$/)
      errors.add :email, 'This is not a valid email format'
    end
  end

  def pan_no_regex
    if pan_no.present? && !pan_no.match(/^([A-Z]{5})(\d{4})([A-Z]{1})$/)
      errors.add :pan_no, 'Please specify Correct Pan Card Number'
    end
  end

  def self.to_txt
    # attributes = %w{employee_id day in out shift_master_id is_proceed present user_id}
    attributes = %w{id first_name middle_name last_name status name}

    CSV.generate(:col_sep => "#~#") do |txt|
      txt << attributes

      all.each do |employee|
        txt << attributes.map{ |attr| employee.send(attr) }
      end
    end
  end

   def name
       "#{self.department.try(:name)}"
    end

  def add_department
    department = Department.find(department_id)
    company_location = department.company_location
    self.company_location_id = company_location.id
    company = company_location.company
    self.company_id = company.id
  end

  def self.collect_rolewise(current_user)
    if current_user.class == Group
      Employee.all.pluck(:id)
    else
      if current_user.role.name == 'GroupAdmin'
        Employee.all.pluck(:id)
      elsif current_user.role.name == 'Admin'
        Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
      elsif current_user.role.name == 'Branch'
        Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
      elsif current_user.role.name == 'HOD'
        Employee.where(department_id: current_user.department_id).pluck(:id)
      elsif current_user.role.name == 'Employee'
        Employee.where(id: current_user.employee_id).pluck(:id)
      end
    end
  end

  def self.filter_by_date_and_costcenter(date, costcenter, current_user)
    month = date.strftime("%B")
    year = date.strftime("%Y")
    @workingday = Workingday.where(month_name: month,year: year).pluck(:employee_id)
    @attendances = EmployeeAttendance.where(day: date).pluck(:employee_id)
    @joining_details = JoiningDetail.where(cost_center_id: costcenter).pluck(:employee_id)
    @roles = collect_rolewise(current_user)
    finals = (@joining_details - @attendances - @workingday) & @roles
    Employee.where(id: finals)
  end
  
  def employee_role_wise(company,company_location,department,current_user)
    if current_user.class == Group
      if company == ""
        @employees = Employee.where(status: 'Active')
      elsif company_location == ""
        @employees = Employee.where(company_id: company.to_i,status: 'Active')
      elsif department == ""
        @employees = Employee.where(company_location_id: company_location.to_i,status: 'Active')
      else
        @employees = Employee.where(company_id: company.to_i,company_location_id: company_location.to_i,department_id: department.to_i,status: 'Active')
      end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if company == ""
          @employees = Employee.where(status: 'Active')
        elsif company_location == ""
          @employees = Employee.where(company_id: company.to_i,status: 'Active')
        elsif department == ""
          @employees = Employee.where(company_location_id: company_location.to_i,status: 'Active')
        else
          @employees = Employee.where(company_id: company.to_i,company_location_id: company_location.to_i,department_id: department.to_i,status: 'Active')
        end
      elsif current_user.role.name == 'Admin'
        if company == ""
          @employees = Employee.where(company_id: current_user.company_location.company_id,status: 'Active')
        elsif company_location == ""
          @employees = Employee.where(company_id: company.to_i,status: 'Active')
        elsif department == ""
          @employees = Employee.where(company_location_id: company_location.to_i,status: 'Active')
        else
          @employees = Employee.where(company_id: company.to_i,company_location_id: company_location.to_i,department_id: department.to_i,status: 'Active')
        end
      elsif current_user.role.name == 'Branch'
        if company == "" || company_location == ""
          @employees = Employee.where(company_location_id: current_user.company_location_id,status: 'Active')
        elsif department == ""
          @employees = Employee.where(company_location_id: company_location.to_i,status: 'Active')
        else 
          @employees = Employee.where(company_id: company.to_i,company_location_id: company_location.to_i,department_id: department.to_i,status: 'Active')
        end
      end
    end
  end

  def employee_type_wise_role(employee_type,company,location,current_user)
    if current_user.class == Group
      if location == ""
        @employees = Employee.where(employee_type_id: employee_type,company_id: company.to_i)
      else 
        @employees = Employee.where(employee_type_id: employee_type,company_id: company.to_i,company_location_id: location.to_i)
      end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if location == ""
          @employees = Employee.where(employee_type_id: employee_type,company_id: company.to_i)
        else 
          @employees = Employee.where(employee_type_id: employee_type,company_id: company.to_i,company_location_id: location.to_i)
        end
       elsif current_user.role.name == 'Admin'
        if location == ""
          @employees = Employee.where(employee_type_id: employee_type,company_id: company.to_i)
        else 
          @employees = Employee.where(employee_type_id: employee_type,company_id: company.to_i,company_location_id: location.to_i)
        end
        elsif current_user.role.name == 'Branch'
        if location == ""
          @employees = Employee.where(employee_type_id: employee_type,company_id: company.to_i)
        else 
          @employees = Employee.where(employee_type_id: employee_type,company_id: company.to_i,company_location_id: location.to_i)
        end
      elsif current_user.role.name == 'HOD'
        @employees = Employee.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
    end
  end

  private

  def self.find_by_role(current_user)
    if current_user.class == Group
      Employee.all
    else
      if current_user.role.name == 'GroupAdmin'
        Employee.all
      elsif current_user.role.name == 'Admin'
        Employee.where(company_id: current_user.company_location.company_id)
      elsif current_user.role.name == 'Branch'
        Employee.where(company_location_id: current_user.company_location_id)
      elsif current_user.role.name == 'Employee'
        Employee.where(id: current_user.employee_id)
      end
    end
  end

  def self.dashboard
    if current_user.class == Group
      Employee.all
    else
      if current_user.role.name == 'GroupAdmin'
        Employee.all
      elsif current_user.role.name == 'Admin'
        Employee.where(company_id: current_user.company_location.company_id)
      elsif current_user.role.name == 'Branch'
        Employee.where(company_location_id: current_user.company_location_id)
      elsif current_user.role.name == 'Employee'
        Employee.where(id: current_user.employee_id)
      end
    end
  end
  

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |employee|
        csv << employee.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
  spreadsheet = open_spreadsheet(file)
    (2..spreadsheet.last_row).each do |i|
        manual_employee_code = spreadsheet.cell(i,'B').to_i
        if manual_employee_code == 0
           manual_employee_code = spreadsheet.cell(i,'B')
        else
           manual_employee_code = spreadsheet.cell(i,'B').to_i
        end
        prefix = spreadsheet.cell(i,'C')
        first_name = spreadsheet.cell(i,'D')
        middle_name = spreadsheet.cell(i,'E')
        last_name = spreadsheet.cell(i,'F')
        gender = spreadsheet.cell(i,'G')
        email = spreadsheet.cell(i,'H')
        if email.nil?
          email = first_name+'@gmail.com'
        else
          email = spreadsheet.cell(i,'H')
        end
        optional_email = spreadsheet.cell(i,'I')
        adhar_no = spreadsheet.cell(i,'J').to_i
        pan_no = spreadsheet.cell(i,'K')
        licence_no = spreadsheet.cell(i,'L')
        contact_no = spreadsheet.cell(i,'M').to_i
        optinal_contact_no = spreadsheet.cell(i,'N').to_i
        optinal_contact_no1 = spreadsheet.cell(i,'O').to_i
        # emergency_contact_no = spreadsheet.cell(i,'P').to_i
        @religion = Religion.find_by_name(spreadsheet.cell(i,'Q'))
        if @religion == nil
           religion_name = spreadsheet.cell(i,'Q')
           @religion_entry = Religion.create(name: religion_name)
           religion_id = @religion_entry.id
        else
        religion_id = @religion.id
        end
        status = spreadsheet.cell(i,'R')
        @employee_type = EmployeeType.find_by_name(spreadsheet.cell(i,'S'))
        if @employee_type == nil
           employee_type_name = spreadsheet.cell(i,'S')
           @employee_type_entry = EmployeeType.create(name: employee_type_name)
           employee_type_id = @employee_type_entry.id
        else
        employee_type_id = @employee_type.id
        end
        marital_status = spreadsheet.cell(i,'T')
        @nationality = Nationality.find_by_name(spreadsheet.cell(i,'U'))
        if @nationality == nil
           nationality_name = spreadsheet.cell(i,'U')
           @nationality_entry = Nationality.create(name: nationality_name)
           nationality_id = @nationality_entry.id
        else
        nationality_id = @nationality.id
        end
        date_of_birth = spreadsheet.cell(i,'V')
        @blood_group = BloodGroup.find_by_name(spreadsheet.cell(i,'W'))
        if @blood_group == nil
           blood_group_name = spreadsheet.cell(i,'W')
           @blood_group_entry = BloodGroup.create(name: blood_group_name)
           blood_group_id = @blood_group_entry.id
        else
        blood_group_id = @blood_group.id
        end
        permanent_address = spreadsheet.cell(i,'X')
        pin_code = spreadsheet.cell(i,'Y')
        @country = Country.find_by_name(spreadsheet.cell(i,'Z'))
        if @country == nil
           country_name = spreadsheet.cell(i,'Z')
           @country_entry = Country.create(name: country_name)
           country_id = @country_entry.id
        else
        country_id = @country.id
      end
        @state = State.find_by_name(spreadsheet.cell(i,'AA'))
        if @state == nil
           state_name = spreadsheet.cell(i,'AA')
           @state_entry = State.create(name: state_name, country_id: country_id)
           state_id = @state_entry.id
        else
        state_id = @state.id
      end
        @district = District.find_by_name(spreadsheet.cell(i,'AB'))
        if @district == nil
           district_name = spreadsheet.cell(i,'AB')
           @district_entry = District.create(name: district_name, state_id: state_id)
           district_id = @district_entry.id
        else
        district_id = @district.id
        end
        city = spreadsheet.cell(i,'AC')
        current_address = spreadsheet.cell(i,'AD')
        handicap = spreadsheet.cell(i,'AE')
        handicap_type = spreadsheet.cell(i,'AF')
        @company = Company.find_by_name(spreadsheet.cell(i,'AG'))
        if @company == nil
          @company_name = Company.last
          company_id = @company_name.id
        else
        company_id = @company.id
        end
        @company_location = CompanyLocation.find_by_name(spreadsheet.cell(i,'AH'))
        if @company_location == nil
          @company_location_name = CompanyLocation.last
          company_location_id = @company_location_name.id
        else
        company_location_id = @company_location.id
        end
        @department = Department.find_by_name(spreadsheet.cell(i,'AI'))
       if @department == nil
          department_name = spreadsheet.cell(i,'AI')
          @department_entry = Department.create(name: department_name, company_location_id: company_location_id)
          department_id = @department_entry.id
       else
        department_id = @department.id
        end
      #   @sub_department = SubDepartment.find_by_name(spreadsheet.cell(i,'AJ'))
      #   if @sub_department == nil
      #     sub_department_name = spreadsheet.cell(i,'AJ')
      #     @sub_department_entry = SubDepartment.create(name: sub_department_name, department_id: department_id)
      #     sub_department_id = @sub_department_entry.id
      #   else
      #   sub_department_id = @sub_department.id
      # end
      @employee_code_master = EmployeeCodeMaster.find_by_name(spreadsheet.cell(i,'AJ'))
       if @employee_code_master == nil
        else
        employee_code_master_id = @employee_code_master.id
        end
        @employee_prsent = Employee.find_by(manual_employee_code: manual_employee_code)
        if @employee_prsent.nil?
          @employee = Employee.create(manual_employee_code: manual_employee_code,prefix: prefix,first_name: first_name,middle_name: middle_name,last_name: last_name,date_of_birth: date_of_birth,gender: gender,contact_no: contact_no,optinal_contact_no: optinal_contact_no,email: email,permanent_address: permanent_address,
          country_id: country_id,state_id: state_id,district_id: district_id,city: city,pin_code: pin_code,current_address: current_address,adhar_no: adhar_no,pan_no: pan_no,licence_no: licence_no,marital_status: marital_status,blood_group_id: blood_group_id,employee_type_id: employee_type_id,nationality_id: nationality_id,religion_id: religion_id,
          handicap: handicap,handicap_type: handicap_type,status: status,company_id: company_id,company_location_id: company_location_id,department_id: department_id,employee_code_master_id: employee_code_master_id,optional_email: optional_email,optinal_contact_no1: optinal_contact_no1)
        else
          @employee_prsent.update(prefix: prefix,first_name: first_name,middle_name: middle_name,last_name: last_name,date_of_birth: date_of_birth,gender: gender,contact_no: contact_no,optinal_contact_no: optinal_contact_no,email: email,permanent_address: permanent_address,
          country_id: country_id,state_id: state_id,district_id: district_id,city: city,pin_code: pin_code,current_address: current_address,adhar_no: adhar_no,pan_no: pan_no,licence_no: licence_no,marital_status: marital_status,blood_group_id: blood_group_id,employee_type_id: employee_type_id,nationality_id: nationality_id,religion_id: religion_id,
          handicap: handicap,handicap_type: handicap_type,status: status,company_id: company_id,company_location_id: company_location_id,department_id: department_id,employee_code_master_id: employee_code_master_id,optional_email: optional_email,optinal_contact_no1: optinal_contact_no1)
        end
  end
end

  def self.import_create_new_user(file)
  spreadsheet = open_spreadsheet(file)
    (2..spreadsheet.last_row).each do |i|
       manual_member_code = spreadsheet.cell(i,'B').to_i
       @employee = Employee.find_by_manual_employee_code(spreadsheet.cell(i,'B').to_i)
        if @employee.nil?
        else
        employee_id = @employee.id
        email = @employee.email
        company_id = @employee.company_id
        company_location_id = @employee.company_location_id
        password = @employee.first_name+'hrms'+@employee.manual_employee_code

        @role = Role.find_by_name(spreadsheet.cell(i,'C'))
        if @role == nil
           @role_entry = Role.find_by(name: "Employee")
           role_id = @role_entry.id
        else
        role_id = @role.id
        end
        @manager = Employee.find_by_manual_employee_code(spreadsheet.cell(i,'D').to_i)
        manager_id = @manager.id

        @manager_2 = Employee.find_by_manual_employee_code(spreadsheet.cell(i,'E').to_i)
        if @manager_2.nil?
        else
        manager_2_id = @manager_2.id
        end
        @employee.update(manager_id: manager_id,manager_2_id: manager_2_id)

        @member = Member.create(manual_member_code: manual_member_code,employee_id: employee_id,email: email,password: password,role_id: role_id,company_id: company_id,company_location_id: company_location_id)
    end
  end
end


  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path, file_warning: :ignore)
      when ".xls" then Roo::Excel.new(file.path, file_warning: :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, file_warning: :ignore)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end  
end
