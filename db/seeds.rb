require 'rubygems'
require 'roo'
# ex = Roo::Excel.new("#{Rails.root}/public/payrolldata.xls")
# ex.default_sheet = ex.sheets[0]
# j = 1
# gross_salary = 0
# ActiveRecord::Base.transaction do
# 1.upto(50) do |line|
#   puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
#   @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
  
#   @salary_template = SalaryTemplate.find_by_id(ex.cell(line,'B'))
#   @salary_component_templates = @salary_template.salary_component_templates unless @salary_template.nil?

#   EmployeeTemplate.create(employee_id: @employee.id, salary_template_id: @salary_template.id, start_date: Date.today)

#   @salary_component_templates.each do |t|
#     EmployeeSalaryTemplate.new do |est|
#       have_esic = @employee.joining_detail.have_esic
#       est.employee_id = @employee.id
#       est.salary_template_id = @salary_template.id
#       est.salary_component_id = t.salary_component_id 
#       est.is_deducted = t.is_deducted
#       est.parent_salary_component_id
#       est.percentage = t.is_deducted
#       est.to_be_paid = t.to_be_paid
#       est.employee_template_id = EmployeeTemplate.last.id
      
#       if t.salary_component.name == "Basic"
#       est.monthly_amount = ex.cell(line,'H') unless ex.cell(line,'H').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'H').to_i
# puts "..........component ........1"
#       elsif t.salary_component.name == "HRA"
#       est.monthly_amount = ex.cell(line,'I') unless ex.cell(line,'I').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary.to_i + ex.cell(line,'I').to_i
#       puts "..........component ........1"
#       elsif t.salary_component.name == "Convenience Allowance"
#       est.monthly_amount = ex.cell(line,'J') unless ex.cell(line,'J').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'J').to_i
#       	puts "..........component ........1"	
#       elsif t.salary_component.name == "Medical Allowance"
#       est.monthly_amount = ex.cell(line,'K') unless ex.cell(line,'K').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary.to_i + ex.cell(line,'K').to_i
# 		puts "..........component ........1"
#       elsif t.salary_component.name == "Other Allowance"
#       est.monthly_amount = ex.cell(line,'L') unless ex.cell(line,'L').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary.to_i + ex.cell(line,'L').to_i
#       puts "..........component ........1"
      
#     end
#       est.save!
#       puts "#{j} component inserted..."
#       j=j+1
   
#   end
#   gross_salary = 0
# end
# end
# end



# ex = Roo::Excel.new("#{Rails.root}/public/payrolldata.xls")
# ex.default_sheet = ex.sheets[0]
# j = 1
# gross_salary = 0
# ActiveRecord::Base.transaction do
# 2.upto(51) do |line|
#   puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
#   @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
  
#   @salary_template = SalaryTemplate.find_by_id(ex.cell(line,'B').to_i)
#   @salary_component_templates = @salary_template.salary_component_templates unless @salary_template.nil?

#   EmployeeTemplate.create(employee_id: @employee.id, salary_template_id: @salary_template.id, start_date: Date.today)

#   @salary_component_templates.each do |t|
#     EmployeeSalaryTemplate.new do |est|
#       have_esic = @employee.joining_detail.have_esic
#       est.employee_id = @employee.id
#       est.salary_template_id = @salary_template.id
#       est.salary_component_id = t.salary_component_id 
#       est.is_deducted = t.is_deducted
#       est.parent_salary_component_id
#       est.percentage = t.is_deducted
#       est.to_be_paid = t.to_be_paid
#       est.employee_template_id = EmployeeTemplate.last.id
  
#       if t.salary_component.name == "Basic"
#       est.monthly_amount = ex.cell(line,'H') unless ex.cell(line,'H').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'H').to_i
#       elsif t.salary_component.name == "HRA"
#       est.monthly_amount = ex.cell(line,'I') unless ex.cell(line,'I').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'I').to_i
#       elsif t.salary_component.name == "Convenience Allowance"
#       est.monthly_amount = ex.cell(line,'J') unless ex.cell(line,'J').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'J').to_i
#       elsif t.salary_component.name == "Other Allowance"
#       est.monthly_amount = ex.cell(line,'L') unless ex.cell(line,'L').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'L').to_i
#       elsif t.salary_component.name == "Medical Allowance"
#       est.monthly_amount = ex.cell(line,'K') unless ex.cell(line,'K').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'K').to_i
#       end
#       est.save!
#       puts "#{j} component inserted..."
#       j=j+1
#     end
#   end
#   gross_salary = 0
# end
# end

# ex = Roo::Excel.new("#{Rails.root}/public/payrolldata.xls")
# ex.default_sheet = ex.sheets[0]
# j = 1
# gross_salary = 0
# ActiveRecord::Base.transaction do
# 2.upto(51) do |line|
#   puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"

#   @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
  
#   @salary_template = SalaryTemplate.find_by_id(ex.cell(line,'B'))
#   @salary_component_templates = @salary_template.salary_component_templates unless @salary_template.nil?

#   EmployeeTemplate.create(employee_id: @employee.try(:id), salary_template_id: @salary_template.id, start_date: Date.today)

#   @salary_component_templates.each do |t|
#     EmployeeSalaryTemplate.new do |est|
#       est.employee_id = @employee.id
#       est.salary_template_id = @salary_template.id
#       est.salary_component_id = t.salary_component_id 
#       est.is_deducted = t.is_deducted
#       est.parent_salary_component_id
#       est.percentage = t.is_deducted
#       est.to_be_paid = t.to_be_paid
#       est.employee_template_id = EmployeeTemplate.last.id
      
#       if t.salary_component.name == "Basic"
#       est.monthly_amount = ex.cell(line,'H') unless ex.cell(line,'H').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'H').to_i
#       puts "Basic..................Salary"

#      elsif t.salary_component.name == "HRA"
#       est.monthly_amount = ex.cell(line,'I') unless ex.cell(line,'I').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'I').to_i

#       puts "HRA..................Salary"
      
#       elsif t.salary_component.name == "Convenience Allowance"
#       est.monthly_amount = ex.cell(line,'J') unless ex.cell(line,'J').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'J').to_i

#       puts "Convenience Allowance..................Salary"

      
      

#       elsif t.salary_component.name == "Medical Allowance"
#       est.monthly_amount = ex.cell(line,'K') unless ex.cell(line,'K').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'K').to_i

#       puts "Medical Allowance..................Salary"

#       elsif t.salary_component.name == "Other Allowance"
#       est.monthly_amount = ex.cell(line,'L') unless ex.cell(line,'L').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'L').to_i

#       puts "Other Allowance..................Salary"


#       # elsif t.salary_component.name == "Bonus"
#       # est.monthly_amount = ex.cell(line,'G') unless ex.cell(line,'G').nil?
#       # est.annual_amount = est.monthly_amount.to_i * 12
#       # gross_salary = gross_salary + ex.cell(line,'G').to_i

#       # puts "Bonus Allowance..................Salary"

      
#     end
#       est.save!
#       puts "#{j} component inserted..."
#       j=j+1
#     end
#   end
#   gross_salary = 0
# end
# end

# ex = Roo::Excel.new("#{Rails.root}/public/rgeejd.xls")

# ex.default_sheet = ex.sheets[1] #siya feb
# i = 1
# ActiveRecord::Base.transaction do

# 2.upto(93) do |line| # siya Feb 2016
#   puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
#   @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A'))
#   JoiningDetail.where(id: @employee.id)(all(employee_uan_no: ex.cell(line, 'B'),employee_pf_no: ex.cell(line, 'C')))
#   puts "#{i} Record inserted.-----------------------------------------------"
#   end
# end

# JoiningDetail.update_all(employee_uan_no: nil)
# JoiningDetail.update_all(employee_pf_no: nil)
# JoiningDetail.update_all(joining_date: nil)
# JoiningDetail.update_all(confirmation_date: nil)
# JoiningDetail.update_all(probation_period: nil)
# JoiningDetail.update_all(notice_period: nil)
# JoiningDetail.update_all(passport_no: nil)
# JoiningDetail.update_all(passport_issue_date: nil)
# JoiningDetail.update_all(passport_expiry_date: nil)
# JoiningDetail.update_all(have_passport: nil)



# ex = Roo::Excel.new("#{Rails.root}/public/member.xls")
# ex.default_sheet = ex.sheets[0] #siya feb
# i = 1
# ActiveRecord::Base.transaction do

# 2.upto(22) do |line| # siya Feb 2016
#   puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
#   @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A'))
#   Member.where(id: @employee.id).update_all(manual_member_code: ex.cell(line, 'B'),role_id: ex.cell(line, 'C').to_i)
#   puts "#{i} Record inserted.---------UAN NO-- #{ex.cell(line, 'B')}..........Pf NO-- #{ex.cell(line, 'C')}"
#   end
# end

# ex = Roo::Excel.new("#{Rails.root}/public/final_rgejd.xls")
# ex.default_sheet = ex.sheets[0] #siya feb
# i = 1
# ActiveRecord::Base.transaction do

# 2.upto(183) do |line| # siya Feb 2016
#   puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
#   @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
#   JoiningDetail.where(id: @employee.id).update_all(employee_uan_no: ex.cell(line, 'B'),employee_pf_no: ex.cell(line, 'C'))
#   puts "#{i} Record inserted.---------UAN NO-- #{ex.cell(line, 'B')}..........Pf NO-- #{ex.cell(line, 'C')}"
#   end
# end


# ex = Roo::Excel.new("#{Rails.root}/public/rgeejd.xls")
# ex.default_sheet = ex.sheets[3] #siya feb
# i = 1
# ActiveRecord::Base.transaction do

# 1.upto(27) do |line| # siya Feb 2016
#   puts "Starting Record --------------------------------------------------#{ex.cell(line,'A')}"
#   @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A'))
#   JoiningDetail.where(id: @employee.id).update_all(employee_uan_no: ex.cell(line, 'B'))
#   puts "#{i} Record inserted.---------------------------------------------#{ex.cell(line, 'B')}"
#   end
# end

# GoalPerspective.destroy_all
# AttributeMaster.destroy_all
# GoalBunch.destroy_all
# GoalRating.destroy_all
# Period.destroy_all

# ex = Roo::Excel.new("#{Rails.root}/public/rgproll.xls")
# ex.default_sheet = ex.sheets[1]
# j = 1
# gross_salary = 0
# ActiveRecord::Base.transaction do
# 2.upto(50) do |line|
#   puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"

#   @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
  
#   @salary_template = SalaryTemplate.find_by_id(ex.cell(line,'B').to_i)
#   @salary_component_templates = @salary_template.salary_component_templates unless @salary_template.nil?
# byebug
#   EmployeeTemplate.create(employee_id: @employee.try(:id), salary_template_id: @salary_template.id, start_date: Date.today)

#   @salary_component_templates.each do |t|
#     EmployeeSalaryTemplate.new do |est|
#       est.employee_id = @employee.id
#       est.salary_template_id = @salary_template.id
#       est.salary_component_id = t.salary_component_id 
#       est.is_deducted = t.is_deducted
#       est.parent_salary_component_id
#       est.percentage = t.is_deducted
#       est.to_be_paid = t.to_be_paid
#       est.employee_template_id = EmployeeTemplate.last.id
      
#       if t.salary_component.name == "Basic"
#       est.monthly_amount = ex.cell(line,'C') unless ex.cell(line,'C').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'C').to_i
#       puts "Basic..................Salary"

#      elsif t.salary_component.name == "HRA"
#       est.monthly_amount = ex.cell(line,'D') unless ex.cell(line,'D').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'D').to_i

#       puts "HRA..................Salary"
      
#       elsif t.salary_component.name == "Convenience Allowance"
#       est.monthly_amount = ex.cell(line,'E') unless ex.cell(line,'E').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'E').to_i

#       puts "Convenience Allowance..................Salary"

#       elsif t.salary_component.name == "Medical Allowance"
#       est.monthly_amount = ex.cell(line,'F') unless ex.cell(line,'F').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'F').to_i

#       puts "Medical Allowance..................Salary"

#   # elsif t.salary_component.name == "Other Allowance"
#   #     est.monthly_amount = ex.cell(line,'L') unless ex.cell(line,'L').nil?
#   #     est.annual_amount = est.monthly_amount.to_i * 12
#   #     gross_salary = gross_salary + ex.cell(line,'L').to_i

#   #     puts "Medical Allowance..................Salary"
#     end
#       est.save!
#       puts "#{j} component inserted..."
#       j=j+1
#     end
#   end
#   gross_salary = 0
# end
# end

# ex = Roo::Excel.new("#{Rails.root}/public/leavedate.xls")
# ex.default_sheet = ex.sheets[2] #siya feb
# i = 1
# ActiveRecord::Base.transaction do
# 2.upto(288) do |line| # siya Feb 2016
#  puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
#  @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
#  # JoiningDetail.where(id: @employee.id).update_all(is_da: true)
#  # EmployeeLeavBalance.where(id: @employee.id).update_all(to_date: nil)
#  puts "#{i} Record inserted.-----------------------------------------------"
#  unless @employee.nil?
#  	@employee_leav_balances = EmployeeLeavBalance.where(employee_id: @employee.id)
# #  @joining_details = JoiningDetail.where(employee_id: @employee.id)

# #    @joining_details.each do |jo|
#   @employee_leav_balances.each do |elb|
# 	 elb.update(from_date: ex.cell(line,'B'))
# 	 puts "#{i}  inserted Balance Successfuly.-----------------------------------------------"
# 	 elb.update(to_date: ex.cell(line,'C'))
# 	 puts "#{i}  inserted Balance Successfuly.-----------------------------------------------"
#   end

# ex = Roo::Excel.new("#{Rails.root}/public/leavedate.xls")
# ex.default_sheet = ex.sheets[2] #siya feb
# i = 1
# ActiveRecord::Base.transaction do
# 2.upto(288) do |line| # siya Feb 2016
#  puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
#  @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
#  # JoiningDetail.where(id: @employee.id).update_all(is_da: true)
#  # EmployeeLeavBalance.where(id: @employee.id).update_all(to_date: nil)
#  puts "#{i} Record inserted.-----------------------------------------------"
#  unless @employee.nil?
#  	@employee_leav_balances = EmployeeLeavBalance.where(employee_id: @employee.id)
# #  @joining_details = JoiningDetail.where(employee_id: @employee.id)

# #    @joining_details.each do |jo|
#   @employee_leav_balances.each do |elb|
# 	 elb.update(from_date: ex.cell(line,'B'))
# 	 puts "#{i}  inserted Balance Successfuly.-----------------------------------------------"
# 	 elb.update(to_date: ex.cell(line,'C'))
# 	 puts "#{i}  inserted Balance Successfuly.-----------------------------------------------"
#   end

# ex = Roo::Excel.new("#{Rails.root}/public/leavedate.xls")
# ex.default_sheet = ex.sheets[3] #siya feb
# i = 1
# ActiveRecord::Base.transaction do
# 2.upto(288) do |line| # siya Feb 2016
#  puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
#  @elbb = EmployeeLeavBalance.find_by_id(ex.cell(line,'A').to_i)
#  puts "#{i} Record inserted.-----------------------------------------------"
#  unless @elbb.nil?
#   @employee_leav_balances = EmployeeLeavBalance.where(id: @elbb.id)
#   @employee_leav_balances.each do |elb|
# 	 elb.update(total_leave: ex.cell(line,'B'))
# 	 puts "#{i}  inserted Balance Successfuly.-----------------------------------------------"
# 	 # elb.update(to_date: ex.cell(line,'C'))
# 	 # puts "#{i}  inserted Balance Successfuly.-----------------------------------------------"
#   end

# # 	@designation = EmployeeDesignation.find_by_name(ex.cell(line,'B'))
# # 	jo.update(employee_designation_id: @designation.id)

# # 	@grade = EmployeeGrade.find_by_name(ex.cell(line,'C'))
# # 	jo.update(employee_grade_id: @grade.id)
#     # end
# end
# end
# end

# ex = Roo::Excel.new("#{Rails.root}/public/0.xls")
# ex.default_sheet = ex.sheets[0] #siya feb
# i = 1
# ActiveRecord::Base.transaction do
# 2.upto(27) do |line| # siya Feb 2016
#  puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
#  @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A'))
#  # JoiningDetail.where(id: @employee.id).update_all(is_da: true)
#  puts "#{i} Record inserted.-----------------------------------------------"
#  unless @employee.nil?
#  @employees = Employee.where(id: @employee.id)

#    @employees.each do |e|
#    	@country1 = Country.find_by_name(ex.cell(line,'B'))
#    	e.update country_id: @country1.id
#    	puts "#{i} Country inserted.-----------------------------------------------"
#    	@state1 = State.find_by_name(ex.cell(line,'C'))
#    	e.update state_id: @state1.id
#    	puts "#{i} State Record inserted.-----------------------------------------------"
#    	@district1 = District.find_by_name(ex.cell(line,'D'))
#    	e.update district_id: @district1.id
#    	puts "#{i} District Record inserted.-----------------------------------------------"
#     e.save!
#    end
#    puts "#{i} Record inserted.-----------------------------------------------"
#    i += 1
#  end
#  end
# end





# ex = Roo::Excel.new("#{Rails.root}/public/o.xls")

# ex.default_sheet = ex.sheets[1] #siya feb
# i = 1
# ActiveRecord::Base.transaction do

# 2.upto(71) do |line| # siya Feb 2016
#   puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
#   @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
#   unless @employee.nil?

#     EmployeeAttendance.new do |w|
#       w.employee_id = @employee.id
#       w.day = ex.cell(line, 'B')
#       w.in = ex.cell(line, 'C')
#       w.out = ex.cell(line, 'D')
#       w.shift_master_id = ex.cell(line, 'G').to_i

      
#       w.save!
#     end
#     puts "#{i} Record inserted.-----------------------------------------------"
#     i += 1
#   end
#   end
# end

# ex = Roo::Excel.new("#{Rails.root}/public/bftl machine attendance.xls")

# ex.default_sheet = ex.sheets[1] #siya feb
# i = 1
# ActiveRecord::Base.transaction do

# 2.upto(71) do |line| # siya Feb 2016
#  puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
#  @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
#  unless @employee.nil?

#    MachineAttendance.new do |w|
#      w.employee_id = @employee.id
#      w.day = ex.cell(line, 'B')
#      w.in = ex.cell(line, 'C')
#      w.out = ex.cell(line, 'D')
#      w.shift_master_id = ex.cell(line, 'G').to_i

     
#      w.save!
#    end
#    puts "#{i} Record inserted.-----------------------------------------------"
#    i += 1
#  end
#  end
# end


# ex = Roo::Excel.new("#{Rails.root}/public/joining_detail_report.xls")
# ex.default_sheet = ex.sheets[1] #siya feb
# i = 1
# ActiveRecord::Base.transaction do
# 2.upto(169) do |line| # siya Feb 2016
#  puts "Starting Record #{ex.cell(line,'B')}---------------------------------------"
#   @employee = Employee.find_by_manual_employee_code(ex.cell(line,'B'))
#  puts "#{i} Record inserting.----------------------------"
#  JoiningDetail.where(id: @employee).update_all(is_employeer_pf: ex.cell(line,'I').to_s,select_pf: ex.cell(line,'J').to_s,employee_pf_no: ex.cell(line,'K').to_s)
#  # JoiningDetail.where(employee_pf_no: ex.cell(line,'D').to_s)
#  puts "#{i} Record inserted.-----------------------------------------------"
#  i += 1
#  end
#  end

# ex = Roo::Excel.new("#{Rails.root}/public/novattendance.xls")
# ex.default_sheet = ex.sheets[1] #siya feb
# i = 1
# ActiveRecord::Base.transaction do

# 2.upto(322) do |line| # siya Feb 201
#   puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
#   @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
#   unless @employee.nil?

#     Workingday.new do |w|
#       w.employee_id = @employee.id
#       w.month_name = ex.cell(line, 'B')
#       w.year = ex.cell(line, 'C').to_i

#       w.day_in_month = ex.cell(line, 'D')
#       w.present_day = ex.cell(line, 'E')
#       w.week_off_day = ex.cell(line, 'F')

#       w.cl_leave = ex.cell(line, 'G').to_i
#       w.el_leave = ex.cell(line, 'H').to_i
#       w.coff_leave = ex.cell(line, 'I').to_i

     
#       w.holiday_in_month = ex.cell(line, 'J')

     
#       w.absent_day = ex.cell(line, 'K')
#       w.payable_day = ex.cell(line, 'L')
#       w.save!
#     end
#     puts "#{i} Record inserted.-----------------------------------------------"
#     i += 1
#   end
#   end
# end

# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
# ex.default_sheet = ex.sheets[0]
# i=1
# 2.upto(3) do |line|
# CompanyType.new do |ct|
#   ct.code = ex.cell(line,'A')
#   ct.name = ex.cell(line,'B')
#   ct.description = ex.cell(line,'C')
#   ct.save!
# end
# puts "#{i} Company Type inserted.-----------------------------------------------"
# i = i+1
# end

# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
# ex.default_sheet = ex.sheets[1]
# i=1
# 2.upto(4) do |line|
# DepartmentType.new do |dt|
#   dt.code = ex.cell(line,'A')
#   dt.name = ex.cell(line,'B')
#   dt.description = ex.cell(line,'C')
#   dt.save!
# end
# puts "#{i} Departmnet Type inserted.-----------------------------------------------"
# i = i+1
# end


# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
# ex.default_sheet = ex.sheets[2]
# i=1
# 2.upto(3) do |line|
# PaymentMode.new do |pm|
#   pm.code = ex.cell(line,'A')
#   pm.name = ex.cell(line,'B')
#   pm.description = ex.cell(line,'C')
#   pm.save!
# end
# puts "#{i} PaymentMode inserted.-----------------------------------------------"
# i = i+1
# end

# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
# ex.default_sheet = ex.sheets[3]
# i=1
# 2.upto(2) do |line|
# EmployeeGrade.new do |eg|
#   eg.code = ex.cell(line,'A')
#   eg.name = ex.cell(line,'B')
#   eg.description = ex.cell(line,'C')
#   eg.save!
# end
# puts "#{i} EmployeeGrade inserted.-----------------------------------------------"
# i = i+1
# end


# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
# ex.default_sheet = ex.sheets[4]
# i=1
# 2.upto(5) do |line|
# EmployeeType.new do |et|
#   et.code = ex.cell(line,'A')
#   et.name = ex.cell(line,'B')
#   et.description = ex.cell(line,'C')
#   et.save!
# end
# puts "#{i} EmployeeType inserted.-----------------------------------------------"
# i = i+1
# end


# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
# ex.default_sheet = ex.sheets[5]
# i=1
# 2.upto(4) do |line|
# EmployeeCategory.new do |ec|
#   ec.code = ex.cell(line,'A')
#   ec.name = ex.cell(line,'B')
#   ec.description = ex.cell(line,'C')
#   ec.save!
# end
# puts "#{i} EmployeeCategory inserted.-----------------------------------------------"
# i = i+1
# end

# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
# ex.default_sheet = ex.sheets[6]
# i=1
# 2.upto(8) do |line|
# Role.new do |ec|
#   ec.code = ex.cell(line,'A')
#   ec.name = ex.cell(line,'B')
#   ec.description = ex.cell(line,'C')
#   ec.save!
# end
# puts "#{i} Role inserted.-----------------------------------------------"
# i = i+1
# end

# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
# ex.default_sheet = ex.sheets[7]
# i=1
# 2.upto(2) do |line|
# Nationality.new do |ec|
#   ec.code = ex.cell(line,'A')
#   ec.name = ex.cell(line,'B')
#   ec.description = ex.cell(line,'C')
#   ec.save!
# end
# puts "#{i} Nationality inserted.-----------------------------------------------"
# i = i+1
# end

# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
# ex.default_sheet = ex.sheets[8]
# i=1
# 2.upto(5) do |line|
# ReservedCategory.new do |ec|
#   ec.code = ex.cell(line,'A')
#   ec.name = ex.cell(line,'B')
#   ec.description = ex.cell(line,'C')
#   ec.save!
# end
# puts "#{i} Reserved Category inserted.-----------------------------------------------"
# i = i+1
# end

# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
# ex.default_sheet = ex.sheets[9]
# i=1
# 2.upto(5) do |line|
# Religion.new do |ec|
#   ec.code = ex.cell(line,'A')
#   ec.name = ex.cell(line,'B')
#   ec.description = ex.cell(line,'C')
#   ec.save!
# end
# puts "#{i} Religion inserted.-----------------------------------------------"
# i = i+1
# end

# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
# ex.default_sheet = ex.sheets[10]
# i=1
# 2.upto(9) do |line|
# RelationMaster.new do |ec|
#   ec.code = ex.cell(line,'A')
#   ec.name = ex.cell(line,'B')
#   ec.description = ex.cell(line,'C')
#   ec.save!
# end
# puts "#{i} Relation inserted.-----------------------------------------------"
# i = i+1
# end

# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
# ex.default_sheet = ex.sheets[11]
# i=1
# 2.upto(4) do |line|
# BloodGroup.new do |ec|
#   ec.name = ex.cell(line,'B')
#   ec.save!
# end
# puts "#{i} BloodGroup inserted.-----------------------------------------------"
# i = i+1
# end


# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
# ex.default_sheet = ex.sheets[12]
# i=1
# 2.upto(33) do |line|
# Degree.new do |ec|
#   ec.code = ex.cell(line,'A')
#   ec.name = ex.cell(line,'B')
#   ec.description = ex.cell(line,'C')
#   ec.save!
# end
# puts "#{i} Dgree inserted.-----------------------------------------------"
# i = i+1
# end


# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
# ex.default_sheet = ex.sheets[13]
# i=1
# 2.upto(11) do |line|
# DegreeType.new do |ec|
#   ec.code = ex.cell(line,'A')
#   ec.name = ex.cell(line,'B')
#   ec.description = ex.cell(line,'C')
#   ec.save!
# end
# puts "#{i} DgreeType inserted.-----------------------------------------------"
# i = i+1
# end

# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
# ex.default_sheet = ex.sheets[14]
# i=1
# 2.upto(15) do |line|
# DegreeStream.new do |ec|
#   ec.code = ex.cell(line,'A')
#   ec.name = ex.cell(line,'B')
#   ec.description = ex.cell(line,'C')
#   ec.save!
# end
# puts "#{i} DgreeStream inserted.-----------------------------------------------"
# i = i+1
# end


# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
# ex.default_sheet = ex.sheets[15]
# i=1
# 2.upto(5) do |line|
# TravelExpenceType.new do |ec|
#   ec.code = ex.cell(line,'A')
#   ec.name = ex.cell(line,'B')
#   ec.description = ex.cell(line,'C')
#   ec.save!
# end
# puts "#{i} TravelExpenceType inserted.-----------------------------------------------"
# i = i+1
# end


# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
# ex.default_sheet = ex.sheets[16]
# i=1
# 2.upto(5) do |line|
# TravelMode.new do |ec|
#   ec.code = ex.cell(line,'A')
#   ec.name = ex.cell(line,'B')
#   ec.description = ex.cell(line,'C')
#   ec.save!
# end
# puts "#{i} TravelMode inserted.-----------------------------------------------"
# i = i+1
# end

# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
# ex.default_sheet = ex.sheets[17]
# i=1
# 2.upto(4) do |line|
# TravelOption.new do |ec|
#   ec.code = ex.cell(line,'A')
#   ec.name = ex.cell(line,'B')
#   ec.discription = ex.cell(line,'C')
#   ec.save!
# end
# puts "#{i} TravelOption inserted.-----------------------------------------------"
# i = i+1
# end

# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
# ex.default_sheet = ex.sheets[18]
# i=1
# 2.upto(7) do |line|
# LeavCategory.new do |ec|
#   ec.code = ex.cell(line,'A')
#   ec.name = ex.cell(line,'B')
#   ec.description = ex.cell(line,'C')
#   ec.is_payble = ex.cell(line,'D')
#   ec.save!
# end
# puts "#{i} LeaveCategory inserted.-----------------------------------------------"
# i = i+1
# end


# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
# ex.default_sheet = ex.sheets[19]
# i=1
# 2.upto(23) do |line|
# SalaryComponent.new do |ec|
#   ec.code = ex.cell(line,'A')
#   ec.name = ex.cell(line,'B')
#   ec.description = ex.cell(line,'C')
#   ec.account_code = ex.cell(line,'D')
#   ec.is_deducted = ex.cell(line,'E')
#   ec.save!
# end
# puts "#{i} SalaryComponent inserted.-----------------------------------------------"
# i = i+1
# end

# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
# ex.default_sheet = ex.sheets[20]
# i=1
# 2.upto(2) do |line|
# Country.new do |ec|
#   ec.code = ex.cell(line,'A')
#   ec.name = ex.cell(line,'B')
#   ec.save!
# end
# puts "#{i} Country inserted.-----------------------------------------------"
# i = i+1
# end

# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
# ex.default_sheet = ex.sheets[21]
# i=1
# 2.upto(37) do |line|
# State.new do |ec|
#   ec.country_id = ex.cell(line,'A')
#   ec.code = ex.cell(line,'B')
#   ec.name = ex.cell(line,'C')
#   ec.save!
# end
# puts "#{i} State inserted.-----------------------------------------------"
# i = i+1
# end

# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
# ex.default_sheet = ex.sheets[24]
# i=1
# 2.upto(22) do |line|
# EmployeeDesignation.new do |ec|
#   ec.code = ex.cell(line,'A')
#   ec.name = ex.cell(line,'B')
#   ec.save!
# end
# puts "#{i} State inserted.-----------------------------------------------"
# i = i+1
# end

# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
# ex.default_sheet = ex.sheets[22]
# i=1
# 2.upto(1033) do |line|
# District.new do |ec|
#   ec.state_id = ex.cell(line,'A')
#   ec.code = ex.cell(line,'B')
#   ec.name = ex.cell(line,'C')
#   ec.save!
# end
# puts " #{i} District inserted.-----------------------------------------------"
# i = i+1
# end


# x = Roo::Excel.new("#{Rails.root}/public/joining_detail.xls")

# ex.default_sheet = ex.sheets[0] #siya feb
# i = 1
# ActiveRecord::Base.transaction do

# 2.upto(71) do |line| # siya Feb 2016
#   puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
#   @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A'))
#   JoiningDetail.where(id: @employee.id).update_all(is_da: true)
#   puts "#{i} Record inserted.-----------------------------------------------"
#   # unless @employee.nil?

#   #   EmployeeAttendance.new do |w|
#   #     w.employee_id = @employee.id
#   #     w.day = ex.cell(line, 'B')
#   #     w.in = ex.cell(line, 'C')
#   #     w.out = ex.cell(line, 'D')
#   #     w.shift_master_id = ex.cell(line, 'G').to_i

      
#   #     w.save!
#   #   end
#   #   puts "#{i} Record inserted.-----------------------------------------------"
#   #   i += 1
#   # end
#   end
# end

# ex = Roo::Excel.new("#{Rails.root}/public/employee_basic_report (1).xls")
# ex.default_sheet = ex.sheets[0] #siya feb
# i = 1
# ActiveRecord::Base.transaction do
# 66.upto(66) do |line| # siya Feb 2016

# ex = Roo::Excel.new("#{Rails.root}/public/updateempcode.xls")
# ex.default_sheet = ex.sheets[0] #siya feb
# i = 1
# ActiveRecord::Base.transaction do
# 2.upto(51) do |line| # siya Feb 2016
#  puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
#  @employee = Employee.find_by_manual_employee_code(ex.cell(line,'B').to_i)
#  puts "#{i} Record inserting.----------------------------"
#  # Employee.where(id: @employee.id).update_all(manual_employee_code: ex.cell(line,'B'))
#  Employee.where(id: @employee.id).update_all(manual_employee_code: ex.cell(line,'C').to_i)
#  puts "#{i} Record inserted.-----------------------------------------------"
#  i += 1
#  end
#  end

ex = Roo::Excel.new("#{Rails.root}/public/updateemppf.xls")
ex.default_sheet = ex.sheets[1] #siya feb
i = 1
ActiveRecord::Base.transaction do
2.upto(51) do |line| # siya Feb 2016
 puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
 @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
 puts "#{i} Record inserting.----------------------------"
 # Employee.where(id: @employee.id).update_all(manual_employee_code: ex.cell(line,'B'))
 JoiningDetail.where(employee_id: @employee.id).update_all(employee_pf_no: ex.cell(line, 'G'),employee_uan_no: ex.cell(line, 'F'),employee_efic_no: ex.cell(line, 'H'),select_pf: ex.cell(line, 'I'),have_esic: ex.cell(line, 'J'),is_employeer_pf: ex.cell(line, 'K'),is_employeer_esic: ex.cell(line, 'L'))
 puts "#{i} Record inserted.-----------------------------------------------"
 i += 1
 end
 end
 
# ex = Roo::Excel.new("#{Rails.root}/public/cid.xls")
# ex.default_sheet = ex.sheets[0] #siya feb
# i = 1
# ActiveRecord::Base.transaction do
# 2.upto(543) do |line| # siya Feb 2016
#  puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
#  @employee = Employee.find_by_id(ex.cell(line,'A'))
#  puts "#{i} Record inserting.----------------------------"
#  # Employee.where(id: @employee.id).update_all(manual_employee_code: ex.cell(line,'B'))
#  Employee.where(id: @employee.id).update_all(manual_employee_code: ex.cell(line,'B'),company_id: ex.cell(line,'C').to_i,company_location_id: ex.cell(line,'D').to_i,department_id: ex.cell(line,'E').to_i)
#  Employee.where(id: @employee.id).update_all(employee_code_master_id: ex.cell(line,'B').to_i)
#  puts "#{i} Record inserted.-----------------------------------------------"
#  i += 1
#  end
#  end


# ex = Roo::Excel.new("#{Rails.root}/public/employer_contribution.xls")
# ex.default_sheet = ex.sheets[0] #siya feb
# i = 1
# ActiveRecord::Base.transaction do
# 2.upto(72) do |line| # siya Feb 2016
#  puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
#  @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A'))
#  puts "#{i} Record inserting.----------------------------"
#  JoiningDetail.where(employee_id: @employee.id).update_all(is_da: ex.cell(line,'B'),is_employeer_pf: ex.cell(line,'C'),is_employeer_esic: ex.cell(line,'D'),is_insurance: ex.cell(line,'E'),is_family_pension: ex.cell(line,'F'),is_bonus: ex.cell(line,'G'),basis_of_time: ex.cell(line,'H'))
#  puts "#{i} Record inserted.-----------------------------------------------"
#  i += 1
#  end
#  end

# ex = Roo::Excel.new("#{Rails.root}/public/employee_punch_card_detail.xls")
# ex.default_sheet = ex.sheets[0] #siya feb
# i = 1
# ActiveRecord::Base.transaction do
# 2.upto(64) do |line| # siya Feb 2016
#  puts "Starting Record #{ex.cell(line,'B')}---------------------------------------"
#  @employee = Employee.find_by_manual_employee_code(ex.cell(line,'B'))
#  puts "#{i} Record inserting.----------------------------"
#  Employee.where(id: @employee.id).update_all(punch_card_id: ex.cell(line,'C').to_i)
#  puts "#{i} Record inserted.-----------------------------------------------"
#  i += 1
#  end
#  end
# EmployeeDesignation.destroy_all

# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/employee designation.xls")
# ex.default_sheet = ex.sheets[0]
# i=1
# 1.upto(31) do |line|
# EmployeeDesignation.new do |pm|
#   pm.code = ex.cell(line,'A')
#   pm.name = ex.cell(line,'B')
#   pm.description = ex.cell(line,'C')
#   pm.save!
# end
# puts "#{i} Employee Designation inserted.-----------------------------------------------"
# i = i+1
# end

# ex = Roo::Excel.new("#{Rails.root}/public/updateemppf.xls")
# ex.default_sheet = ex.sheets[0] #siya feb
# i = 1
# ActiveRecord::Base.transaction do

# 2.upto(51) do |line| # siya Feb 2016
#   puts "Starting Record --------------------------------------------------#{ex.cell(line,'A').to_i}"
#   @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
#   JoiningDetail.find_by(employee_id: @employee.id).update(employee_pf_no: ex.cell(line, 'G'))
#   puts "#{i} Record inserted.---------------------------------------------#{ex.cell(line, 'B').to_i}"
#   end
# end

# ex = Roo::Excel.new("#{Rails.root}/public/updateemppf.xls")
# ex.default_sheet = ex.sheets[0] #siya feb
# i = 1
# ActiveRecord::Base.transaction do

# 2.upto(51) do |line| # siya Feb 2016
#   puts "Starting Record --------------------------------------------------#{ex.cell(line,'A').to_i}"
#   @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A'))
#   JoiningDetail.where(employee_id: @employee.id).update_all(employee_pf_no: ex.cell(line, 'G'),employee_uan_no: ex.cell(line, 'F'),employee_efic_no: ex.cell(line, 'H'),select_pf: ex.cell(line, 'I'),have_esic: ex.cell(line, 'J'),is_employeer_pf: ex.cell(line, 'K'),is_employeer_esic: ex.cell(line, 'L'))
#   puts "#{i} Record inserted.---------------------------------------------#{ex.cell(line, 'B').to_i}"
#   end
# end

# ex = Roo::Excel.new("#{Rails.root}/public/sasi_dec_attendance_recent.xls")
# ex.default_sheet = ex.sheets[0] #siya feb
# i = 1
# ActiveRecord::Base.transaction do
# 2.upto(1092) do |line| # siya Feb 2016
#  puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
#  # byebug
#  @employee = Employee.find_by_punch_card_id(ex.cell(line,'A').to_i)
#  puts "#{i} Record inserting.----------------------------"
#  # MachineAttendance.where(employee_id: @employee.id).update_all(employee_id: @employee.id,in: ex.cell(line,'B'),out: ex.cell(line,'C'),shift_master_id: ex.cell(line,'E'),present: ex.cell(line,'F').to_s,day: ex.cell(line,'G'))
#  MachineAttendance.where(employee_id: @employee.id).create(employee_id: @employee.id,in: ex.cell(line,'B'),out: ex.cell(line,'C'),shift_master_id: ex.cell(line,'E'),present: ex.cell(line,'F').to_s,day: ex.cell(line,'G'))
#  puts "#{i} Record inserted.-----------------------------------------------"
#  i += 1
#  end
#  end

# ex = Roo::Excel.new("#{Rails.root}/public/sasi_dec_attendance.xls")
# ex.default_sheet = ex.sheets[1] #siya feb
# i = 1
# ActiveRecord::Base.transaction do
# 2.upto(32) do |line| # siya Feb 2016
#  puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
#  # byebug
#  @employee = Employee.find_by_punch_card_id(ex.cell(line,'A').to_i)
#  puts "#{i} Record inserting.----------------------------"
#  # MachineAttendance.where(employee_id: @employee.id).update_all(employee_id: @employee.id,in: ex.cell(line,'B'),out: ex.cell(line,'C'),shift_master_id: ex.cell(line,'E'),present: ex.cell(line,'F').to_s,day: ex.cell(line,'G'))
#  MachineAttendance.where(employee_id: @employee.id).create(employee_id: @employee.id,in: ex.cell(line,'B'),out: ex.cell(line,'C'),shift_master_id: ex.cell(line,'E'),present: ex.cell(line,'F').to_s,day: ex.cell(line,'G'))
#  puts "#{i} Record inserted.-----------------------------------------------"
#  i += 1
#  end
#  end

# ex = Roo::Excel.new("#{Rails.root}/public/Yearly Workingdays.xls")
# ex.default_sheet = ex.sheets[0] #siya feb
# i = 1
# ActiveRecord::Base.transaction do
# 2.upto(513) do |line| # siya Feb 2016
#  puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
#  # byebug
#  @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
#  puts "#{i} Record inserting.----------------------------"
#  # MachineAttendance.where(employee_id: @employee.id).update_all(employee_id: @employee.id,in: ex.cell(line,'B'),out: ex.cell(line,'C'),shift_master_id: ex.cell(line,'E'),present: ex.cell(line,'F').to_s,day: ex.cell(line,'G'))
#  EmployeeLeavBalance.where(employee_id: @employee.id).update_all(total_leave: ex.cell(line,'B'))
#  puts "#{i} Record inserted.-----------------------------------------------"
#  i += 1
#  end
#  end


# ex = Roo::Excel.new("#{Rails.root}/public/leave balance.xls")
# ex.default_sheet = ex.sheets[1] #siya feb
# i = 1
# ActiveRecord::Base.transaction do
# 2.upto(385) do |line| # siya Feb 2016
#  puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
#  @employee = Employee.where(manual_employee_code: ex.cell(line,'A').to_i).pluck(:id)
#  @emp_leav_bal = EmployeeLeavBalance.where(employee_id: @employee,leav_category_id: 2).pluck(:id)
#  puts "#{i} Record inserting.----------------------------"
#  EmployeeLeavBalance.where(id: @emp_leav_bal).update_all(no_of_leave: ex.cell(line,'B'))
#  puts "#{i} Record inserted.-----------------------------------------------"
#  i += 1
#  end
#  end




# ex = Roo::Excel.new("#{Rails.root}/public/rgwdd.xls")
# ex.default_sheet = ex.sheets[0] #siya feb
# i = 1
# ActiveRecord::Base.transaction do
# 2.upto(155) do |line| # siya Feb 2016
#  puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
#  @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A'))
#  puts "#{i} Record inserting.----------------------------"
#  Workingday.where(employee_id: @employee.id).update_all(month_name: ex.cell(line,'B'),year: ex.cell(line,'C'),day_in_month: ex.cell(line,'D'),payable_day: ex.cell(line,'E'))
#  puts "#{i} Record inserted.-----------------------------------------------"
#  i += 1
#  end
#  end

# ex = Roo::Excel.new("#{Rails.root}/public/rgwdj.xls")
# ex.default_sheet = ex.sheets[1] #siya feb
# i = 1
# ActiveRecord::Base.transaction do
# 1.upto(150) do |line| # siya Feb 2016
#  puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
#  @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A'))
#  puts "#{i} Record inserting.----------------------------"
#  Workingday.where(employee_id: @employee.id).update_all(month_name: ex.cell(line,'D'),year: ex.cell(line,'E'),day_in_month: ex.cell(line,'F'),payable_day: ex.cell(line,'C'))
#  puts "#{i} Record inserted.-----------------------------------------------"
#  i += 1
#  end
#  end

# ex = Roo::Excel.new("#{Rails.root}/public/rgwdj.xls")
# ex.default_sheet = ex.sheets[1] #siya feb
# i = 1
# ActiveRecord::Base.transaction do
# 1.upto(150) do |line| # siya Feb 2016
#  puts "Starting 89 #{ex.cell(line,'A')}---------------------------------------"
#  @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A'))
#  puts "#{i} Record inserting.----------------------------"
#  Workingday.where(employee_id: @employee.id).update_all(month_name: ex.cell(line,'D'),year: ex.cell(line,'E'),day_in_month: ex.cell(line,'F'),payable_day: ex.cell(line,'C'))
#  puts "#{i} Record inserted.-----------------------------------------------"
#  i += 1
#  end
#  end

# a = EmployeeCodeMaster.all
# EmployeeCodeMaster.where(id: a.id).update_all(last_range: 10546)


# a = Employee.all
# Employee.where(id: a.id).update_all(prefix: "Mr.")


# b = Employee.where(gender: "Female")
# Employee.where(id: b.id).update_all(prefix: "Miss.")
# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/Employee Redefine.xls")
# ex.default_sheet = ex.sheets[0] 
# i=1

# 2.upto(51) do |line|
# Employee.new do |e|
#   e.manual_employee_code = ex.cell(line,'A').to_i
#   e.first_name = ex.cell(line,'B')
#   e.middle_name = ex.cell(line,'C')
#   e.last_name = ex.cell(line,'D')
#   e.gender = ex.cell(line,'E')
#   e.adhar_no = ex.cell(line,'F').to_i
#   e.pan_no = ex.cell(line,'G')
#   e.licence_no = ex.cell(line,'H')
#   e.marital_status = ex.cell(line,'I')
#   @nation = Nationality.find_by_name(ex.cell(line,'J'))
#   e.nationality_id = @nation.id unless @nation.nil?
#   e.date_of_birth = ex.cell(line,'K')
#   @blood = BloodGroup.find_by_name(ex.cell(line,'L'))
#   e.blood_group_id = @blood.id unless @blood.nil?
#   e.permanent_address = ex.cell(line,'M')
#   e.pin_code = ex.cell(line,'N').to_i
#   @country = Country.find_by_name(ex.cell(line,'O'))
#   e.country_id = @country.id unless @country.nil?
#   @state = State.find_by_name(ex.cell(line,'P'))
#   e.state_id = @state.id unless @state.nil?
#   @district = District.find_by_name(ex.cell(line,'Q'))
#   e.district_id =  @district.id unless @district.nil?
#   e.city = ex.cell(line,'R')
#   e.current_address = ex.cell(line,'S')
#   @religion = Religion.find_by_name(ex.cell(line,'T'))
#   e.religion_id = @religion.id unless @religion.nil?
#   e.contact_no = ex.cell(line,'U').to_i
#   e.email = ex.cell(line,'V')
#   e.handicap = ex.cell(line,'W')
#   e.handicap_type = ex.cell(line, 'X')
  
#   @type = EmployeeType.find_by_name(ex.cell(line,'Y'))
#   e.employee_type_id = @type.id unless @type.nil?

#   e.status = ex.cell(line,'Z')
  
#   e.company_id = ex.cell(line,'AA').to_i
#   @type1 = CompanyLocation.find_by_name(ex.cell(line,'AB'))
#   e.company_location_id = @type1.id unless @type1.nil?
#   @type2 = Department.find_by_name(ex.cell(line,'AC'))
#   e.department_id =  @type2.id unless @type2.nil?

#   @code_master = EmployeeCodeMaster.find_by_name(ex.cell(line,'AD'))
#   e.employee_code_master_id = @code_master.id unless @code_master.nil?

#   e.save!
# end
# puts "#{i} Employee inserted.-----------------------------------------------"
# i = i+1
# end


# ex = Roo::Excel.new("#{Rails.root}/public/rgwdd.xls")
#  ex.default_sheet = ex.sheets[0] #siya feb
#  i = 1
#  ActiveRecord::Base.transaction do

#  2.upto(155) do |line| # siya Feb 201
#    puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
#    @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
#    unless @employee.nil?

#      Workingday.new do |w|
#        w.employee_id = @employee.id
#        w.month_name = ex.cell(line, 'B')
#        w.year = ex.cell(line, 'C').to_i
#        w.day_in_month = ex.cell(line, 'D')
#        w.payable_day = ex.cell(line, 'E')
#        w.save!
#      end
#      puts "#{i} Record inserted.-----------------------------------------------"
#      i += 1
#    end
#    end
#  end

 # ex = Roo::Excel.new("#{Rails.root}/public/rgwdj.xls")
 # ex.default_sheet = ex.sheets[4] #siya feb
 # i = 1
 # ActiveRecord::Base.transaction do

 # 1.upto(165) do |line| # siya Feb 201
 #   puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
 #   @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
 #   unless @employee.nil?

 #     Workingday.new do |w|
 #       w.employee_id = @employee.id
 #       w.month_name = ex.cell(line, 'B')
 #       w.year = ex.cell(line, 'C').to_i
 #       w.day_in_month = ex.cell(line, 'D')
 #       w.payable_day = ex.cell(line, 'E')
 #       w.save!
 #     end
 #     puts "#{i} Record inserted.-----------------------------------------------"
 #     i += 1
 #   end
 #   end
 # end
 
#  ex = Roo::Excel.new("#{Rails.root}/public/rgwdj.xls")
#  ex.default_sheet = ex.sheets[5] #siya feb
#  i = 1
#  ActiveRecord::Base.transaction do

#  1.upto(166) do |line| # siya Feb 201
#    puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
#    @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
#    unless @employee.nil?

#      Workingday.new do |w|
#        w.employee_id = @employee.id
#        w.month_name = ex.cell(line, 'B')
#        w.year = ex.cell(line, 'C').to_i
#        w.day_in_month = ex.cell(line, 'D')
#        w.payable_day = ex.cell(line, 'E')
#        w.save!
#      end
#      puts "#{i} Record inserted.-----------------------------------------------"
#      i += 1
#    end
#    end
#  end

 # ex = Roo::Excel.new("#{Rails.root}/public/rgwdj.xls")
 # ex.default_sheet = ex.sheets[5] #siya feb
 # i = 1
 # ActiveRecord::Base.transaction do

 # 1.upto(166) do |line| # siya Feb 201
 #   puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
 #   @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
 #   unless @employee.nil?

 #     Workingday.new do |w|
 #       w.employee_id = @employee.id
 #       w.month_name = ex.cell(line, 'B')
 #       w.year = ex.cell(line, 'C').to_i
 #       w.day_in_month = ex.cell(line, 'D')
 #       w.payable_day = ex.cell(line, 'E')
 #       w.save!
 #     end
 #     puts "#{i} Record inserted.-----------------------------------------------"
 #     i += 1
 #   end
 #   end
 # end


 # ex = Roo::Excel.new("#{Rails.root}/public/rgwdj.xls")
 # ex.default_sheet = ex.sheets[6] #siya feb
 # i = 1
 # ActiveRecord::Base.transaction do

 # 2.upto(7) do |line| # siya Feb 201
 #   puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
 #   @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
 #   unless @employee.nil?
 #     Workingday.new do |w|
 #       w.employee_id = @employee.id
 #       w.month_name = ex.cell(line, 'B')
 #       w.year = ex.cell(line, 'C').to_i
 #       w.day_in_month = ex.cell(line, 'D')
 #       w.payable_day = ex.cell(line, 'E')
 #       w.save!
 #     end
 #     puts "#{i} Record inserted.-----------------------------------------------"
 #     i += 1
 #   end
 #   end
 # end

 # ex = Roo::Excel.new("#{Rails.root}/public/rgwdj.xls")
 # ex.default_sheet = ex.sheets[3] #siya feb
 # i = 1
 # ActiveRecord::Base.transaction do

 # 1.upto(17) do |line| # siya Feb 201
 #   puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
 #   @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
 #   unless @employee.nil?

 #     Workingday.new do |w|
 #       w.employee_id = @employee.id
 #       w.month_name = ex.cell(line, 'B')
 #       w.year = ex.cell(line, 'C').to_i
 #       w.day_in_month = ex.cell(line, 'D')
 #       w.payable_day = ex.cell(line, 'E')
 #       w.save!
 #     end
 #     puts "#{i} Record inserted.-----------------------------------------------"
 #     i += 1
 #   end
 #   end
 # end

 # EmployeeLeavBalance.update_all(is_confirm: false)

# FoodDeduction.last.destroy

# ex = Roo::Excel.new("#{Rails.root}/public/joining_detail_report.xls")
# ex.default_sheet = ex.sheets[2] #siya feb
# i = 1
# ActiveRecord::Base.transaction do
# 2.upto(169) do |line| # siya Feb 2016
#  puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
#  @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A'))
#  # JoiningDetail.where(id: @employee.id).update_all(is_da: true)
#  puts "#{i} Record inserted.-----------------------------------------------"
#  unless @employee.nil?
#  @joining_details = JoiningDetail.where(employee_id: @employee.id)

#   @joining_details.each do |e|
#     e.is_employeer_pf = ex.cell(line,'B').to_s
#      e.select_pf = ex.cell(line,'C').to_s
#      e.employee_pf_no = ex.cell(line,'D').to_s

#     e.save!
#    end
#    puts "#{i} Record inserted.-----------------------------------------------"
#    i += 1
#  end
#  end
# end

# ex = Roo::Excel.new("#{Rails.root}/public/rgfdj.xls")
#  ex.default_sheet = ex.sheets[3] #siya feb
#  i = 1
#  ActiveRecord::Base.transaction do

#  2.upto(77) do |line| # siya Feb 201
#    puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
#    @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
#    unless @employee.nil?

#      FoodDeduction.new do |w|
#        w.employee_id = @employee.id
#        w.no_of_coupan = ex.cell(line, 'B')
#        w.return_coupan = ex.cell(line, 'C').to_i
#        w.total_coupan = ex.cell(line, 'D')
#        w.food_coupan_master_id = ex.cell(line, 'E').to_i
#        w.amount = ex.cell(line, 'F')
#        w.food_date = ex.cell(line, 'G')
#        w.save!
#      end
#      puts "#{i} Record inserted.-----------------------------------------------"
#      i += 1
#    end
#    end
#  end

# ex = Roo::Excel.new("#{Rails.root}/public/rgfdf.xls")
#  ex.default_sheet = ex.sheets[3] #siya feb
#  i = 1
#  ActiveRecord::Base.transaction do

#  2.upto(74) do |line| # siya Feb 201
#    puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
#    @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
#    unless @employee.nil?

#      FoodDeduction.new do |w|
#        w.employee_id = @employee.id
#        w.no_of_coupan = ex.cell(line, 'B')
#        w.return_coupan = ex.cell(line, 'C').to_i
#        w.total_coupan = ex.cell(line, 'D')
#        w.food_coupan_master_id = ex.cell(line, 'E').to_i
#        w.amount = ex.cell(line, 'F')
#        w.food_date = ex.cell(line, 'G')
#        w.save!
#      end
#      puts "#{i} Record inserted.-----------------------------------------------"
#      i += 1
#    end
#    end
#  end



# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/employee bank details.xls")
# ex.default_sheet = ex.sheets[0] 
# i=1
# 2.upto(51) do |line|
# @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
# EmployeeBankDetail.new do |b|
#   b.employee_id = @employee.id unless @employee.nil?
#   b.account_no = ex.cell(line,'B').to_i
#   b.bank_name = ex.cell(line,'C')
#   b.branch_name = ex.cell(line,'D')
#   # b.address = ex.cell(line,'A')
#   b.contact_no = ex.cell(line,'E').to_i
#   b.micr_code = ex.cell(line,'F').to_i
#   b.branch_code = ex.cell(line,'G').to_i
#   b.ifsc_code = ex.cell(line,'H')
#   b.bank_id = ex.cell(line,'I').to_i
#   b.save!
# end
# puts "#{i} Record inserted.-----------------------------------------------"
# i = i+1
# end

# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/j.xls")
# ex.default_sheet = ex.sheets[0]
# i=1

# 2.upto(163) do |line|
# @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A'))
# JoiningDetail.new do |j|
#   j.employee_id = @employee.id unless @employee.nil?

#   j.employee_uan_no = ex.cell(line,'B')
#   j.joining_date = ex.cell(line,'C')
#   j.confirmation_date = ex.cell(line,'D')

#   @designation = EmployeeDesignation.find_by_name(ex.cell(line,'E'))
#   j.employee_designation_id = @designation.id unless @designation.nil?

#   @grade = EmployeeGrade.find_by_name(ex.cell(line,'F'))
#   j.employee_grade_id = @grade.id unless @grade.nil?

#   j.select_pf = ex.cell(line,'G')
#   j.employee_pf_no = ex.cell(line,'H')
#   j.pf_max_amount = ex.cell(line,'I')
#   j.have_esic = ex.cell(line,'J')
#   j.employee_efic_no = ex.cell(line,'K')

#   @pay_mode = PaymentMode.find_by_name(ex.cell(line,'L'))
#   j.payment_mode_id = @pay_mode.id unless @pay_mode.nil?

#   @cost_center = CostCenter.find_by_name(ex.cell(line,'M'))
#   j.cost_center_id = @cost_center.id unless @cost_center.nil?

#   @category = EmployeeCategory.find_by_name(ex.cell(line,'N'))
#   j.employee_category_id = @category.id unless @category.nil?

#   j.medical_schem = ex.cell(line,'O')
#   j.probation_period = ex.cell(line,'P')
#   j.notice_period = ex.cell(line,'Q')
#   j.have_passport = ex.cell(line,'R')
#   j.passport_no = ex.cell(line,'S')
#   j.passport_issue_date = ex.cell(line,'T')
#   j.passport_expiry_date = ex.cell(line,'U')
#   j.have_retention = ex.cell(line,'V')
#   j.retirement_date = ex.cell(line,'W')

#   @reserved_category = ReservedCategory.find_by_name(ex.cell(line,'X'))
#   j.reserved_category_id = @reserved_category.id unless @reserved_category.nil?


#   # j.is_employeer_pf = ex.cell(line,'Y')
#   # j.is_employeer_esic = ex.cell(line,'Z')
#   # j.is_insurance = ex.cell(line,'AA')
#   # j.is_family_pension = ex.cell(line,'AB')
#   # j.is_bonus = ex.cell(line,'AC')
#   j.save!
# end
# puts "#{i} Record inserted.-----------------------------------------------"
# i = i+1
# end


# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/empleavebalance.xls")
# ex.default_sheet = ex.sheets[0] 
# i=1

# 2.upto(142) do |line|
# @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
# EmployeeLeavBalance.new do |j|
#   j.employee_id = @employee.id unless @employee.nil?
#   j.leav_category_id = ex.cell(line,'B')
#   j.no_of_leave = ex.cell(line,'C')
#   j.total_leave = ex.cell(line,'D')
#   j.is_active = ex.cell(line,'E')
#   j.save!
# end
# puts "#{i} Record inserted.-----------------------------------------------"
# i = i+1
# end



# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/passout_year.xls")
# ex.default_sheet = ex.sheets[0] 
# i=1

# 2.upto(51) do |line|
# Year.new do |j|
#   j.name = ex.cell(line,'A')
#   j.save!
# end
# puts "#{i} Record inserted.-----------------------------------------------"
# i = i+1
# end

# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/passout_year.xls")
# ex.default_sheet = ex.sheets[1] 
# i=1

# 2.upto(44) do |line|
# University.new do |j|
#   j.name = ex.cell(line,'A')
#   j.save!
# end
# puts "#{i} Record inserted.-----------------------------------------------"
# i = i+1
# end


# ex = Roo::Excel.new("#{Rails.root}/public/employee_qualification.xls")
# ex.default_sheet = ex.sheets[0] #siya feb
# i = 1
# ActiveRecord::Base.transaction do
# 2.upto(154) do |line| # siya Feb 2016
#  puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
#  @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)

#    Qualification.new do |qual|
#    	qual.employee_id = @employee.id
#    	puts "#{i} Employee inserted.-----------------------------------------------"

#    	@qualification_level = DegreeType.find_by_name(ex.cell(line,'B'))
#    	qual.degree_type_id = @qualification_level.id
#    	puts "#{i} Qualification Level inserted.-----------------------------------------------"

#    	@qualification = Degree.find_by_name(ex.cell(line,'C'))
#    	qual.degree_id = @qualification.id
#    	puts "#{i} Qualification inserted.-----------------------------------------------"

#    	@qualification_specialization = DegreeStream.find_by_name(ex.cell(line,'D'))
#    	qual.degree_stream_id = @qualification_specialization.id
#    	puts "#{i} Qualification Specialization inserted.-----------------------------------------------"

#    	qual.marks = ex.cell(line,'E')
#    	puts "#{i} Marks inserted.-----------------------------------------------"

#    	@passout_year = Year.find_by_name(ex.cell(line,'F'))
#    	qual.year_id = @passout_year.id
#    	puts "#{i} Passout Year inserted.-----------------------------------------------"

#    	qual.college = ex.cell(line,'G')
#    	puts "#{i} College inserted.-----------------------------------------------"

#    	@university = University.find_by_name(ex.cell(line,'H'))
#    	qual.university_id = @university.id
#    	puts "#{i} Passout Year inserted.-----------------------------------------------"

   	
#     qual.save!
#    end
#    puts "#{i} Record inserted.-----------------------------------------------"
#    i += 1
#  end
#  end



# ex = Roo::Excel.new("#{Rails.root}/public/passout_year.xls")
# ex.default_sheet = ex.sheets[3] #siya feb
# i = 1
# ActiveRecord::Base.transaction do
# 2.upto(154) do |line| # siya Feb 2016\
#  puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
#  @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)

#    Experience.new do |exp|
#    	exp.employee_id = @employee.id
#    	puts "#{i} Employee inserted.-----------------------------------------------"

#    	exp.company_name = ex.cell(line,'B')
#    	puts "#{i} Company Name inserted.-----------------------------------------------"

#     exp.designation = ex.cell(line,'C')
#    	puts "#{i} Designation inserted.-----------------------------------------------"

#    	exp.no_of_year = ex.cell(line,'D')
#    	puts "#{i} No of Year inserted.-----------------------------------------------"

#    	exp.ctc = ex.cell(line,'E')
#    	puts "#{i} CTC inserted.-----------------------------------------------"

#     exp.save!
#    end
#    puts "#{i} Record inserted.-----------------------------------------------"
#    i += 1
#  end
#  end



# ex = Roo::Excel.new("#{Rails.root}/public/HRMSONE EMPLOYEE DATA.xls")
# ex.default_sheet = ex.sheets[1] #siya feb
# i = 1
# ActiveRecord::Base.transaction do
# 2.upto(114) do |line| # siya Feb 2016
#  puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
#  @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A'))
#  # JoiningDetail.where(id: @employee.id).update_all(is_da: true)
#  puts "#{i} Record inserted.-----------------------------------------------"
#  unless @employee.nil?
#  @employees = Employee.where(id: @employee.id)

#    @employees.each do |e|
# #    	@country1 = Country.find_by_name(ex.cell(line,'B'))
# #    	e.update country_id: @country1.id
# #    	puts "#{i} Country inserted.-----------------------------------------------"
# #    	@state1 = State.find_by_name(ex.cell(line,'C'))
# #    	e.update state_id: @state1.id
# #    	puts "#{i} State Record inserted.-----------------------------------------------"
# #    	@district1 = District.find_by_name(ex.cell(line,'D'))
# #    	e.update district_id: @district1.id
# #    	puts "#{i} District Record inserted.-----------------------------------------------"

#   e.update(manual_employee_code: ex.cell(line,'A').to_i)
#   e.update(first_name: ex.cell(line,'B'))
#   e.update(middle_name: ex.cell(line,'C'))
#   e.update(last_name: ex.cell(line,'D'))
#   e.update(gender: ex.cell(line,'E'))
#   e.update(adhar_no: ex.cell(line,'F').to_i)
#   e.update(pan_no: ex.cell(line,'G'))
#   e.update(licence_no: ex.cell(line,'H'))
#   # e.update(marital_status: ex.cell(line,'I'))
#   # @nation = Nationality.find_by_name(ex.cell(line,'J'))
#   # e.update(nationality_id: @nation.id unless @nation.nil?)
#   # e.update(date_of_birth: ex.cell(line,'K'))
#   # @blood = BloodGroup.find_by_name(ex.cell(line,'L'))
#   # e.update(blood_group_id: @blood.id unless @blood.nil?)
#   e.update(permanent_address: ex.cell(line,'J'))
#   e.update(pin_code: ex.cell(line,'K').to_i)
#   # @country = Country.find_by_name(ex.cell(line,'O'))
#   # e.update(country_id: @country.id unless @country.nil?)
#   # @state = State.find_by_name(ex.cell(line,'P'))
#   # e.update(state_id: @state.id unless @state.nil?)
#   # @district = District.find_by_name(ex.cell(line,'Q'))
#   # e.update(district_id:  @district.id unless @district.nil?)
#   e.update(city: ex.cell(line,'L'))
#   e.update(current_address: ex.cell(line,'M'))
#   # @religion = Religion.find_by_name(ex.cell(line,'T'))
#   # e.update(religion_id: @religion.id unless @religion.nil?)
#   e.update(contact_no: ex.cell(line,'O').to_i)
#   e.update(email: ex.cell(line,'P'))
#   e.update(handicap: ex.cell(line,'Q'))
#   e.update(handicap_type: ex.cell(line, 'R'))
#     e.save!
#    end
#    puts "#{i} Record inserted.-----------------------------------------------"
#    i += 1
#  end
#  end
# end


# ex = Roo::Excel.new("#{Rails.root}/public/Onboarding Data Template.xls")
# ex.default_sheet = ex.sheets[0] #siya feb
# i = 1
# ActiveRecord::Base.transaction do
# 2.upto(51) do |line| # siya Feb 2016
#  puts "Starting Record --------------------------#{ex.cell(line,'A')}"
#  @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
#  # JoiningDetail.where(id: @employee.id).update_all(is_da: true)
#  unless @employee.nil?

#  @joining_details = JoiningDetail.where(employee_id: @employee.id)
#   @joining_details.new do |e|
#      e.employee_uan_no = ex.cell(line,'B').to_i
#      e.joining_date =  ex.cell(line,'C')
#      e.confirmation_date =  ex.cell(line,'D')
#      @designation = EmployeeDesignation.find_by_name(ex.cell(line,'E'))
#      e.employee_designation_id = @designation.id unless @designation.nil?
#       @grade = EmployeeGrade.find_by_name(ex.cell(line,'F'))
#      e.employee_grade_id = @grade.id unless @grade.nil?
#      # e.employee_pf_no = ex.cell(line,'F').to_i
#      @category = EmployeeCategory.find_by_name(ex.cell(line,'G'))
#      e.employee_category_id = @category.id unless @category.nil?

     
#      # e.probation_period = ex.cell(line,'J').to_i
#      # e.notice_period =     ex.cell(line,'K').to_i
#      # e.passport_no = ex.cell(line,'M').to_i
#      # e.have_passport = ex.cell(line,'L')
#      # e.passport_issue_date = ex.cell(line,'N')
#      # e.passport_expiry_date = ex.cell(line,'O')
#     e.save!

#     puts "Save...."
#    end
#    puts "#{i} Record inserted.------#{ex.cell(line,'B')}--------#{ex.cell(line,'C')}---------#{ex.cell(line,'D')}.....#{ex.cell(line,'E')}......#{ex.cell(line,'G')}"
#    i += 1
#  end
#  end
# end

# VacancyMaster.destroy_all
# ReportingMastersVacancyMaster.destroy_all
# ParticularVacancyRequest.destroy_all
# InterviewSchedule.destroy_all
# InterviewRoundReschedule.destroy_all
# InterviewAnalysis.destroy_all
# InterviewType.destroy_all
# InterviewRound.destroy_all
# SelectedResume.destroy_all
# InterviewAttribute.destroy_all
# InterviewDecision.destroy_all
# InterviewEvalution.destroy_all


# ex = Roo::Excel.new("#{Rails.root}/public/employee bank details.xls")
# ex.default_sheet = ex.sheets[0] #siya feb
# i = 1
# ActiveRecord::Base.transaction do
# 2.upto(51) do |line| # siya Feb 2016
#  puts "Starting Record --------------------------#{ex.cell(line,'A')}"
#  @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A'))
#  # JoiningDetail.where(id: @employee.id).update_all(is_da: true)
#  # unless @employee.nil?
#  @employee_bank_details = EmployeeBankDetail.where(employee_id: @employee.id)

#   @employee_bank_details.each do |e|
#     e.account_no = ex.cell(line,'B').to_i
#     e.bank_name = ex.cell(line,'C')
#     e.branch_name = ex.cell(line,'D')
#     e.contact_no = ex.cell(line,'E').to_i
#     e.micr_code = ex.cell(line,'F').to_i
#     e.branch_code = ex.cell(line,'G').to_i
#     e.ifsc_code = ex.cell(line,'H')
#     e.bank_id = ex.cell(line, 'I').to_i
#     e.save!
#    end
#    puts "#{i} Record inserted.------#{ex.cell(line,'B')}--------------------#{ex.cell(line,'C')}--------------"
#    i += 1
#  end
#  # end
# end
