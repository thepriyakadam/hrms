class Department < ActiveRecord::Base
  protokoll :department_code, pattern: 'DEPT###'
  belongs_to :company_location
  belongs_to :department_type
  has_many :employees
  has_many :member
  has_many :joining_details
  has_many :vacancy_masters
  has_many :shift_rotations
  has_many :vacancy_request_histories
  has_many :employee_promotions
  has_many :accident_records
  has_many :rewards_allocations
  has_many :travel_request_histories
  has_many :employee_transfers
  has_many :goal_perspectives
  
  validates :manual_department_code, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true
  validates :company_location_id, presence: true
  validates :department_type_id, presence: true


  def self.filter_records(current_user)
    @departments =  if current_user.class == Group
      Department.all
    elsif current_user.class == Member
      if current_user.role.name == "GroupAdmin"
        @employees = Employee.where(company_id: current_user.company_id)
        Department.where(employee_id: @employees)
      elsif current_user.role.name == "Admin"
        @employees = Employee.where(company_id: current_user.company_location.company_id)
      elsif current_user.role.name == "Branch"
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        Department.where(employee_id: @employees)  
      elsif current_user.role.name == "HOD"
        @employees = Employee.where(department_id: current_user.department_id)
        Department.where(employee_id: @employees)
      elsif current_user.role.name == "Employee"
        Department.where(employee_id: current_user.employee_id)
      end
    end
  end

end
