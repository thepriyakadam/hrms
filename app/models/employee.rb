class Employee < ActiveRecord::Base
  protokoll :employee_code, :pattern => "EMP#######"
  belongs_to :department
  belongs_to :company_location
  belongs_to :nationality
  belongs_to :blood_group
  belongs_to :employee_type
  belongs_to :country
  belongs_to :state
  belongs_to :district
  belongs_to :religion
  has_many :awards
  has_many :certifications
  has_many :qualifications
  has_many :employee_leav_requests
  has_many :first_reporters, class_name: "EmployeeLeavRequest", foreign_key: "first_reporter_id"
  has_many :second_reporters, class_name: "EmployeeLeavRequest", foreign_key: "second_reporter_id"
  has_many :leave_status_records, class_name: "LeaveStatusRecord", foreign_key: 'change_status_employee_id'
  has_many :employee_leav_balances
  has_many :families
  has_many :experiences
  has_many :skillsets
  has_many :employee_salary_templates
  has_many :overtimes
  has_many :workingdays
  has_many :employee_templates
  has_many :particular_leave_records
  has_many :society_member_ships
  has_many :monthly_expences
  has_one :employee_shift
  has_one :member
  has_one :employee_bank_detail
  has_one :joining_detail
  accepts_nested_attributes_for :joining_detail
  has_many :subordinates, class_name: "Employee",
                          foreign_key: "manager_id"
  belongs_to :manager, class_name: "Employee"

  has_many :indirect_subordinates, class_name: "Employee",
                          foreign_key: "manager_2_id"
  belongs_to :manager_2, class_name: "Employee"

  validates :manual_employee_code, :presence => true, uniqueness: { case_sensitive: false }
  validates :first_name, :presence => true
  #validate  :email_regex
  validates :permanent_address, :presence => true
  # validates :country_id, :presence => true
  # validates :state_id, :presence => true
  # validates :district_id, :presence => true

  validate :adhar_no_regex
  validate :pan_no_regex

  def adhar_no_regex
    if adhar_no.present? and not adhar_no.match(/[0-9]{12}/)
      errors.add :adhar_no,"Please specify Correct Adhar Number"
    end
  end

  def email_regex
    if email.present? and not email.match(/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.(com|net|org|info|com.au|in|in.co|))?$/)
      errors.add :email, "This is not a valid email format"
    end
  end

  def pan_no_regex
    if pan_no.present? and not pan_no.match(/^([A-Z]{5})(\d{4})([A-Z]{1})$/)
      errors.add :pan_no,"Please specify Correct Pan Card Number"
    end
  end
end
