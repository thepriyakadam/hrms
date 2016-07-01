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
  		s.contact_no = employee.contact_no
  		s.esic_no = @joining_detail.employee_efic_no
  		s.pf_no = @joining_detail.employee_pf_no
  		s.uan_no = @joining_detail.employee_uan_no
  		# s.cl = workingday.cl_leave
  		# s.el = workingday.el_leave
  		# s.c_off = workingday.coff_leave
  		# s.advance = 
      @leave_balances = EmployeeLeavBalance.where(employee_id: employee.id)
      @leave_balances.each do |b|
        if b.leav_category.name == "Casual Leave"
          s.cl_b = b.no_of_leave
        elsif b.leav_category.name == "Earned Leave"
          s.el_b = b.no_of_leave
        elsif b.leav_category.name == "Advance Leave"
          s.advance_b = b.no_of_leave
        elsif b.leav_category.name == "C.Off"
          s.c_off_b = b.no_of_leave
        end
      end
      s.save
  	end
  end
end
