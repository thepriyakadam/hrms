class SlipInformation < ActiveRecord::Base
  belongs_to :salaryslip
  belongs_to :cost_center
  belongs_to :department

  def self.create_salaryslip_information(salaryslip, employee)
  	@joining_detail = JoiningDetail.find_by_employee_id(employee.id)
  	SlipInformation.new do |s|
  		s.salaryslip_id = salaryslip.id
  		s.cost_center_id = @joining_detail.cost_center_id
  		s.department_id = employee.department_id
  		#s.contact_no = employ
  		s.esic_no = @joining_detail.employee_efic_no
  		s.pf_no = @joining_detail.employee_pf_no
  		s.uan_no = @joining_detail.employee_uan_no
  		# s.cl = 
  		# s.el = 
  		# s.c_off = 
  		# s.advance = 
  		# s.cl_b = 
  		# s.el_b = 
  		# s.c_off_b = 
  		# s.advance_b =
  		s.save 
  	end
  end
end