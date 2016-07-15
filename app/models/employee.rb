class Employee < ActiveRecord::Base
  protokoll :employee_code, pattern: 'EMP#######'
  belongs_to :department
  belongs_to :company_location
  belongs_to :nationality
  belongs_to :blood_group
  belongs_to :employee_type
  belongs_to :country
  belongs_to :state
  belongs_to :district
  belongs_to :religion
  has_many :trainees

  has_many :employee_attendances
  has_many :leav_c_offs
  has_many :salaryslips
  has_many :employee_nominations
  has_many :awards
  has_many :certifications
  has_many :interview_schedules
  has_many :vacancy_masters
  has_many :interview_reschedules
  has_many :qualifications
  has_many :employee_leav_requests
  has_many :first_reporters, class_name: 'EmployeeLeavRequest', foreign_key: 'first_reporter_id'
  has_many :second_reporters, class_name: 'EmployeeLeavRequest', foreign_key: 'second_reporter_id'
  has_many :leave_status_records, class_name: 'LeaveStatusRecord', foreign_key: 'change_status_employee_id'
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
  has_many :overtimes
  has_many :workingdays
  has_many :employee_templates
  has_many :particular_leave_records
  has_many :society_member_ships
  has_many :monthly_expences
  has_many :bonus_employees
  has_many :employee_goals
  has_one :employee_shift
  has_one :member
  has_one :employee_bank_detail
  has_one :joining_detail
  has_many :employee_promotions
  has_many :training_requests
  has_many :interview_rounds
  has_many :goal_bunches
  has_many :employee_documents
  
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
  before_create :add_department
  before_update :add_department

  validates :manual_employee_code, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :permanent_address, presence: true
  validates :department_id,presence: true
  
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
      if current_user.role.name == 'Company'
        Employee.all.pluck(:id)
      elsif current_user.role.name == 'CompanyLocation'
        Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
      elsif current_user.role.name == 'Department'
        Employee.where(id: current_user.department_id).pluck(:id)
      elsif current_user.role.name == 'Employee'
        Employee.where(id: current_user.employee_id).pluck(:id)
      end
    end
  end

  private

  def self.find_by_role(current_user)
    if current_user.class == Group
      Employee.all
    else
      if current_user.role.name == 'Company'
        Employee.all
      elsif current_user.role.name == 'CompanyLocation'
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
      if current_user.role.name == 'Company'
        Employee.all
      elsif current_user.role.name == 'CompanyLocation'
        Employee.where(company_location_id: current_user.company_location_id)
      elsif current_user.role.name == 'Employee'
        Employee.where(id: current_user.employee_id)
      end
    end
  end

  
  def self.filter_by_date_and_department(date, department)
    @attendances = EmployeeAttendance.where(day: date).pluck(:employee_id)
    @departments = Employee.where(department_id: department).pluck(:id)
    Employee.where(id: @departments - @attendances)  
  end
end
