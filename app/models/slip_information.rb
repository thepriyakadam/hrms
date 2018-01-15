class SlipInformation < ActiveRecord::Base
  belongs_to :salaryslip
  belongs_to :cost_center
  belongs_to :department

  def self.create_salaryslip_information(salaryslip, employee, workingday)
  	@joining_detail = JoiningDetail.find_by_employee_id(employee.id)
    @employee_bank_details = EmployeeBankDetail.find_by_employee_id(employee.id)
  	SlipInformation.new do |s|
  		s.salaryslip_id = salaryslip.id
  		s.cost_center_id = @joining_detail.try(:cost_center_id)
  		s.department_id = employee.department_id
  		s.contact_no = employee.contact_no
  		s.esic_no = @joining_detail.try(:employee_efic_no)
  		s.pf_no = @joining_detail.try(:employee_pf_no)
  		s.uan_no = @joining_detail.try(:employee_uan_no)
      s.employee_designation_id = @joining_detail.try(:employee_designation_id)
      # s.account_no = @employee_bank_details.account_no
  		
      s.save
  	end
  end
end