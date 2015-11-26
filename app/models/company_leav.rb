class CompanyLeav < ActiveRecord::Base
  belongs_to :employee_grade
  belongs_to :leav_category
  has_many :employee_leav_balances
  after_create :create_employee_leave_balance
  after_update :update_employee_leave_balance

  def create_employee_leave_balance
  	@company_leave = CompanyLeav.find(id)
  	@employee_list = JoiningDetail.where('employee_grade_id = ?', @company_leave.employee_grade_id)
  	@employee_list.each do |e|
  		@company_leave.employee_leav_balances.create(employee_id: e.employee_id, leav_category_id: @company_leave.leav_category_id, no_of_leave: @company_leave.no_of_leave)
  	end
  end

  def update_employee_leave_balance
  	employee_list = EmployeeLeavBalance.where('company_leav_id=?',id)
  	employee_list.each {|e| e.update_attributes(leav_category_id: leav_category_id, no_of_leave: no_of_leave)}  	
  end
end
