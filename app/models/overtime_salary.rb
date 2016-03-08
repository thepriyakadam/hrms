class OvertimeSalary < ActiveRecord::Base
  belongs_to :employee
  before_create :calculate_amount
  #after_update :update_employee_leave_balance

  def calculate_amount
    @overtime_master = OvertimeMaster.find_by_status(true)
    temp = (6500/@overtime_master.day/@overtime_master.company_hrs*@overtime_master.ot_rate*self.ot_hrs)
    puts temp
    puts "--------------------------------------------------------------------------"
  end
end
