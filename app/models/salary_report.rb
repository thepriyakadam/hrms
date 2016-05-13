class SalaryReport
# def self.columns() @columns ||= []; end
 
 #  def self.column(name, sql_type = nil, default = nil, null = true)
 #    columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)
 #  end

  # column :employee_name, :string
	# column :department_name, :string
	# column :code, :integer
	# column :pf_no, :integer
	# column :esic_no, :integer
	# column :actual_basic, :integer
	# column :actual_da, :integer
	# column :actual_hra, :integer
	# column :actual_convenience, :integer
	# column :actual_other, :integer
	# column :actual_special, :integer
	# column :actual_washing, :integer
	# column :actual_total, :integer
	# column :earned_basic, :integer
	# column :earned_da, :integer
	# column :earned_hra, :integer
	# column :earned_convenience, :integer
	# column :earned_other, :integer
	# column :earned_special, :integer
	# column :earned_washing, :integer
	# column :earned_total, :integer
	# column :pf, :integer
	# column :esic, :integer
	# column :income_tax, :integer
	# column :pt, :integer
	# column :advance, :integer
	# column :society, :integer
	# column :food_deduction, :integer
	# column :mobile, :integer
	# column :retention, :integer
	# column :deduction_total, :integer
	# column :net_payable, :integer
	# column :total_leave, :integer
	# column :cl_leave, :integer
	# column :el_leave, :integer
	# column :lwp_leave, :integer
	# column :day_in_month, :integer
	# column :payable_day, :integer
	# column :present_day, :integer
	# column :absent_day, :integer
	# column :holiday, :integer
	# column :weekoff, :integer

	attr_accessor :employee_name, :department_name, :code, :pf_no, :esic_no,
	              :actual_basic, :actual_da, :actual_hra, :actual_convenience, :actual_other, :actual_special, :actual_washing, :actual_total,
	              :earned_basic, :earned_da, :earned_hra, :earned_convenience, :earned_other, :earned_special, :earned_washing, :earned_total,
	              :pf, :esic, :income_tax, :pt, :advance, :society, :food_deduction, :mobile, :retention, :deduction_total, :net_payable,
	              :total_leave, :cl_leave, :el_leave, :lwp_leave, :day_in_month, :payable_day, :present_day, :absent_day, :holiday, :weekoff, :month, :year

	def self.collect_data(e, j, sl)
		addable_items = SalaryslipComponent.where(salaryslip_id: sl.id, is_deducted: false, is_arrear: nil)
		deductable_items = SalaryslipComponent.where(salaryslip_id: sl.id, is_deducted: true, is_arrear: nil)

		wd = Workignday.find(sl.workingday_id)
		sr = SalaryReport.new
		sr.month = sl.month
		sr.year = sl.year
		sr.employee_name = e.try(:first_name).to_s + ' ' + e.try(:last_name).to_s
		sr.department_name = e.department.try(:name)
		sr.code = e.manual_employee_code
		sr.pf_no = j.employee_pf_no
		sr.esic_no = j.employee_efic_no

		addable_items.each do |a|
			case a.salary_component.try(:name)
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

	  sr.earned_total = addable_items.sum(:calculated_amount).round
	  sr.actual_total = addable_items.sum(:actual_amount).round
		
		deductable_items.each do |d|
			case d.other_component_name
			  when "PF"
			  sr.pf = d.calculated_amount.to_i
			  when "ESIC"  
			  sr.esic = d.calculated_amount.to_i
			  when "Income Tax"
			  sr.income_tax = d.calculated_amount
			  when "Prof. Tax"
			  sr.pt = d.calculated_amount
			  when "Advance" 
			  sr.advance = d.calculated_amount.to_i
			  when "Society"
			  sr.society = d.calculated_amount
			  when "Food Deduction"
			  sr.food_deduction = d.calculated_amount.to_i
			  when "Mobile Deduction"
			  sr.mobile = d.calculated_amount
			  when "Retention"
			  sr.retention = d.calculated_amount
			end
		end  
	  
	  sr.deduction_total =  deductable_items.sum(:calculated_amount).try(:to_i)
	  sr.net_payable = sr.earned_total - sr.deduction_total.to_i
	  
	  #sr.total_leave = wd.el_leave.to_f + wd.cl_leave.to_f + wd.coff_leave.to_f
	  sr.cl_leave = wd.cl_leave.to_f
	  sr.el_leave = wd.el_leave.to_f
	  sr.lwp_leave = wd.lwp_leave.to_f + wd.esic_leave.to_f
	  sr.day_in_month = wd.day_in_month
	  sr.payable_day = wd.payable_day
	  sr.present_day = wd.present_day
	  sr.absent_day = wd.absent_day
	  sr.holiday = wd.holiday_in_month.to_i
	  sr.weekoff = wd.week_off_day
	  sr
	end

	def self.create_sum(reports)
		@sum = SalaryReport.new
		array_actual_basic = reports.collect {|r| r.try(:actual_basic)}.compact
    @sum.actual_basic = array_actual_basic.inject(0){|sum,x| sum + x }

    array_actual_da = reports.collect {|r| r.try(:actual_da)}.compact
    @sum.actual_da = array_actual_da.inject(0){|sum,x| sum + x }

    array_actual_hra = reports.collect {|r| r.try(:actual_hra)}.compact
    @sum.actual_hra = array_actual_hra.inject(0){|sum,x| sum + x }

    array_actual_convenience = reports.collect {|r| r.try(:actual_convenience)}.compact
    @sum.actual_convenience = array_actual_convenience.inject(0){|sum,x| sum + x }

    array_actual_other = reports.collect {|r| r.try(:actual_other)}.compact
    @sum.actual_other = array_actual_other.inject(0){|sum,x| sum + x }

    array_actual_special = reports.collect {|r| r.try(:actual_special)}.compact
    @sum.actual_special = array_actual_special.inject(0){|sum,x| sum + x }

    array_actual_washing = reports.collect {|r| r.try(:actual_washing)}.compact
    @sum.actual_washing = array_actual_washing.inject(0){|sum,x| sum + x }

    array_actual_total = reports.collect {|r| r.try(:actual_total)}.compact
    @sum.actual_total = array_actual_total.inject(0){|sum,x| sum + x }


    array_earned_basic = reports.collect {|r| r.try(:earned_basic)}.compact
    @sum.earned_basic = array_earned_basic.inject(0){|sum,x| sum + x }

    array_earned_da = reports.collect {|r| r.try(:earned_da)}.compact
    @sum.earned_da = array_earned_da.inject(0){|sum,x| sum + x }

    array_earned_hra = reports.collect {|r| r.try(:earned_hra)}.compact
    @sum.earned_hra = array_earned_hra.inject(0){|sum,x| sum + x }

    array_earned_convenience = reports.collect {|r| r.try(:earned_convenience)}.compact
    @sum.earned_convenience = array_earned_convenience.inject(0){|sum,x| sum + x }

    array_earned_other = reports.collect {|r| r.try(:earned_other)}.compact
    @sum.earned_other = array_earned_other.inject(0){|sum,x| sum + x }

    array_earned_special = reports.collect {|r| r.try(:earned_special)}.compact
    @sum.earned_special = array_earned_special.inject(0){|sum,x| sum + x }

    array_earned_washing = reports.collect {|r| r.try(:earned_washing)}.compact
    @sum.earned_washing = array_earned_washing.inject(0){|sum,x| sum + x }

    array_earned_total = reports.collect {|r| r.try(:earned_total)}.compact
    @sum.earned_total = array_earned_total.inject(0){|sum,x| sum + x }

    array_pf = reports.collect {|r| r.try(:pf)}.compact
    @sum.pf = array_pf.inject(0){|sum,x| sum + x }

    array_esic = reports.collect {|r| r.try(:esic)}.compact
    @sum.esic = array_esic.inject(0){|sum,x| sum + x }

    array_income_tax = reports.collect {|r| r.try(:income_tax)}.compact
    @sum.income_tax = array_income_tax.inject(0){|sum,x| sum + x }

    array_pt = reports.collect {|r| r.try(:pt)}.compact
    @sum.pt = array_pt.inject(0){|sum,x| sum + x }

    array_advance = reports.collect {|r| r.try(:advance)}.compact
    @sum.advance = array_advance.inject(0){|sum,x| sum + x }

    array_society = reports.collect {|r| r.try(:society)}.compact
    @sum.society = array_society.inject(0){|sum,x| sum + x }

    array_food_deduction = reports.collect {|r| r.try(:food_deduction)}.compact
    @sum.food_deduction = array_food_deduction.inject(0){|sum,x| sum + x }

    array_mobile = reports.collect {|r| r.try(:mobile)}.compact
    @sum.mobile = array_mobile.inject(0){|sum,x| sum + x }

    array_retention = reports.collect {|r| r.try(:retention)}.compact
    @sum.retention = array_retention.inject(0){|sum,x| sum + x }

    array_deduction_total = reports.collect {|r| r.try(:deduction_total)}.compact
    @sum.deduction_total = array_deduction_total.inject(0){|sum,x| sum + x }

    array_net_payable = reports.collect {|r| r.try(:net_payable)}.compact
    @sum.net_payable = array_net_payable.inject(0){|sum,x| sum + x }

    array_total_leave = reports.collect {|r| r.try(:total_leave)}.compact
    @sum.total_leave = array_total_leave.inject(0){|sum,x| sum + x }

    array_cl_leave = reports.collect {|r| r.try(:cl_leave)}.compact
    @sum.cl_leave = array_cl_leave.inject(0){|sum,x| sum + x }

    array_el_leave = reports.collect {|r| r.try(:el_leave)}.compact
    @sum.el_leave = array_el_leave.inject(0){|sum,x| sum + x }

		array_lwp_leave = reports.collect {|r| r.try(:lwp_leave)}.compact
    @sum.lwp_leave = array_lwp_leave.inject(0){|sum,x| sum + x.to_i }

    array_payable_day = reports.collect {|r| r.try(:payable_day)}.compact
    @sum.payable_day = array_payable_day.inject(0){|sum,x| sum + x }

    array_present_day = reports.collect {|r| r.try(:present_day)}.compact
    @sum.present_day = array_present_day.inject(0){|sum,x| sum + x }

    array_absent_day = reports.collect {|r| r.try(:absent_day)}.compact
    @sum.absent_day = array_absent_day.inject(0){|sum,x| sum + x }

    array_holiday = reports.collect {|r| r.try(:holiday)}.compact
    @sum.holiday = array_holiday.inject(0){|sum,x| sum + x }

    array_weekoff = reports.collect {|r| r.try(:weekoff)}.compact
    @sum.weekoff = array_weekoff.inject(0){|sum,x| sum + x }

    @sum
	end

	def salary_ledger(emp)
		salaryslips = Salaryslip.where(employee_id: emp.id)
		salaryslips.each do |s|
			addable_items = SalaryslipComponent.where(salaryslip_id: s.id, is_deducted: false, is_arrear: nil)
		  deductable_items = SalaryslipComponent.where(salaryslip_id: s.id, is_deducted: true, is_arrear: nil)
		  
		end
	end
end