class SlipInformation < ActiveRecord::Base
  belongs_to :salaryslip
  belongs_to :cost_center
  belongs_to :department

  def self.create_salaryslip_information(salaryslip, employee, workingday)
  	@joining_detail = JoiningDetail.find_by_employee_id(employee.id)
    @employee_bank_detail = EmployeeBankDetail.find_by_employee_id(employee.id)
  	SlipInformation.new do |s|
  		s.salaryslip_id = salaryslip.id
  		s.cost_center_id = @joining_detail.cost_center_id
  		s.department_id = employee.department_id
  		s.contact_no = employee.contact_no
  		s.esic_no = @joining_detail.employee_efic_no
  		s.pf_no = @joining_detail.employee_pf_no
      # s.account_no = @employee_bank_detail.account_no
  		s.uan_no = @joining_detail.employee_uan_no
  		
      s.save
  	end
  end
end