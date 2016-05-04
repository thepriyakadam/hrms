class SalaryReport
	attr_accessor :employee_name, :department_name, :code, :pf_no, :esic_no,
	              :actual_basic, :actual_da, :actual_hra, :actual_convenience, :actual_other, :actual_special, :actual_washing, :actual_total,
	              :earned_basic, :earned_da, :earned_hra, :earned_convenience, :earned_other, :earned_special, :earned_washing, :earned_total,
	              :pf, :esic, :income_tax, :pt, :advance, :society, :food_deduction, :mobile, :retention, :deduction_total, :net_payable,
	              :total_leave, :lwp_leave, :day_in_month, :present_day, :absent_day, :holiday, :weekoff

	def self.collect_data(e, j, wd, sl)
		puts e.class
		puts j.class
		puts wd.class
		puts sl.class
		puts "----------------------------------------"
		addable_items = SalaryslipComponent.where(salaryslip_id: sl.id, is_deducted: false)
		deductable_items = SalaryslipComponent.where(salaryslip_id: sl.id, is_deducted: true)

		sr = SalaryReport.new
		sr.employee_name = e.try(:first_name).to_s + ' ' + e.try(:last_name).to_s
		sr.department_name = e.department.try(:name)
		sr.code = e.manual_employee_code
		sr.pf_no = j.employee_pf_no
		sr.esic_no = j.employee_efic_no

		addable_items.each do |a|
			case a.salary_component.name
			  when "Basic"
			  sr.actual_basic = a.actual_amount.round
			  sr.earned_basic = a.calculated_amount.round

			  when "DA"
			  sr.actual_da = a.actual_amount.round
			  sr.earned_da = a.calculated_amount.round

			  when "HRA"
			  sr.actual_hra = a.actual_amount.round
			  sr.earned_hra = a.calculated_amount.round

			  when "Convenience Allowance"
			  sr.actual_convenience = a.actual_amount.round
			  sr.earned_convenience = a.calculated_amount.round

			  when "Other Allowance"
			  sr.actual_other = a.actual_amount.round
			  sr.earned_other = a.calculated_amount.round

			  when "Special Allowance"
			  sr.actual_special = a.actual_amount.round
			  sr.earned_special = a.calculated_amount.round 

			  when "Washing Allowance"
			  sr.actual_washing = a.actual_amount.round
			  sr.earned_washing = a.calculated_amount.round
			end
		end

	  sr.earned_total = addable_items.sum(:actual_amount).round
	  sr.actual_total = addable_items.sum(:calculated_amount).round
		
		deductable_items.each do |d|
			case d.other_component_name
			  when "PF"
			  sr.pf = d.calculated_amount
			  when "ESIC"  
			  sr.esic = d.calculated_amount
			  when "Income Tax"
			  sr.income_tax = d.calculated_amount
			  when "Prof. Tax"
			  sr.pt = d.calculated_amount
			  when "Advance" 
			  sr.advance = d.calculated_amount
			  when "Society"
			  sr.society = d.calculated_amount
			  when "Food Deduction"
			  sr.food_deduction = d.calculated_amount
			  when "Mobile Deduction"
			  sr.mobile = d.calculated_amount
			  when "Retention"
			  sr.retention = d.calculated_amount
			end
		end  
	  
	  sr.deduction_total =  deductable_items.sum(:calculated_amount)
	  sr.net_payable = sr.actual_total - sr.deduction_total
	  
	  sr.total_leave = wd.total_leave
	  sr.lwp_leave = wd.lwp_leave
	  sr.day_in_month = wd.day_in_month
	  sr.present_day = wd.present_day
	  sr.absent_day = wd.absent_day
	  sr.holiday = wd.holiday_in_month
	  sr.weekoff = wd.week_off_day
	  sr
	end
end