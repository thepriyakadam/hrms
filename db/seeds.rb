
# require 'rubygems'
# require 'roo'

# # ex = Roo::Excel.new("#{Rails.root}/public/1.xls")
# # ex.default_sheet = ex.sheets[0]
# # j = 1
# # 2.upto(27) do |line|
# #   puts "Starting Record---------------------------------------"
# #   @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
  
# #   unless @employee.nil?
# #     Instalment.n do |a|
# #       a.employee_id = @employee.id  
# #       a.advance_date = ex.cell(line,'C').to_date unless ex.cell(line,'C').nil?
# #       a.advance_amount = ex.cell(line,'D').to_f unless ex.cell(line,'D').nil?
# #       a.instalment_amount = ex.cell(line,'F').to_f unless ex.cell(line,'F').nil?
# #       #a.no_of_instalment = ex.cell(line,'E').to_i
# #       unless a.advance_amount.nil? and a.instalment_amount.nil?
# #       a.no_of_instalment = (a.advance_amount.to_i / a.instalment_amount).ceil
# #       end
# #       a.save!
# #     end

# #     @advance_salary = AdvanceSalary.find_by_employee_id(@employee.id)
# #     unless @advance_salary.nil?
# #       for i in 1..@advance_salary.no_of_instalment.to_i
# #         Instalment.new do |i|
# #           i.advance_salary_id = @advance_salary.id
# #           #i.instalment_date = 
# #           i.instalment_amount = @advance_salary.instalment_amount
# #           i.save!
# #         end
# #       end
# #     end
# #   end
# # end

# # ex = Roo::Excel.new("#{Rails.root}/public/2.xls")
# # # ex = Roo::Excel.new("#{Rails.root}/public/Employee Wise_Service Master.xls")
# # ex.default_sheet = ex.sheets[0] #siya feb
# # i = 1
# # ActiveRecord::Base.transaction do
# # 2.upto(107) do |line| # siya Feb 2016
# #  puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
# #   @installment = Instalment.find_by_id(ex.cell(line,'A').to_i)
# #  puts "#{i} Record inserting.----------------------------"

# #  Instalment.where(id: @installment).update_all(instalment_date: (ex.cell(line,'C')))
# #  # JoiningDetail.where(employee_pf_no: ex.cell(line,'D').to_s)
# #  puts "#{i} Record inserted.-----------------------------------------------"
# #  i += 1
# #  end
# #  end


# <<<<<<< HEAD
# ex = Roo::Excel.new("#{Rails.root}/public/sparline jan.xls")
# ex.default_sheet = ex.sheets[0] #siya feb
# i = 1
# ActiveRecord::Base.transaction do
# 2.upto(132) do |line| # siya Feb 2016

#  puts "Starting Record #{ex.cell(line,'B')}---------------------------------------"
#   @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
#  puts "#{i} Record inserting.----------------------------"
#  Workingday.where(employee_id: @employee).update_all(payable_day: (ex.cell(line,'C')), calculated_payable_days: (ex.cell(line,'C')) )
#  puts "#{i} Record inserted. #{ex.cell(line,'C')}----------------------"
#  i += 1
#  end
#  end
# =======
# # ex = Roo::Excel.new("#{Rails.root}/public/sparline jan.xls")
# # ex.default_sheet = ex.sheets[0] #siya feb
# # i = 1
# # ActiveRecord::Base.transaction do
# # 2.upto(132) do |line| # siya Feb 2016

# #  puts "Starting Record #{ex.cell(line,'B')}---------------------------------------"
# #   @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
# #  puts "#{i} Record inserting.----------------------------"
# #  Workingday.where(employee_id: @employee).update_all(payable_day: (ex.cell(line,'C')), calculated_payable_days: (ex.cell(line,'C')) )
# #  puts "#{i} Record inserted. #{ex.cell(line,'C')}----------------------"
# #  i += 1
# #  end
# #  end
# >>>>>>> 5dd99c479691f2d05532308a161eaba9356e35db

# require 'rubygems'
# require 'roo'

# <<<<<<< HEAD
# ex = Roo::Excel.new("#{Rails.root}/public/rb1.xls")
# ex.default_sheet = ex.sheets[0]
# j = 1
# gross_salary = 0
# ActiveRecord::Base.transaction do
# 2.upto(64) do |line|
#   puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"

#   @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
# =======
# ex = Roo::Excel.new("#{Rails.root}/public/ctc.xls")
# ex.default_sheet = ex.sheets[0]
# j = 1
# gross_salary = 0
# ActiveRecord::Base.transaction do
# 2.upto(73) do |line|
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
#       est.monthly_amount = ex.cell(line,'C') unless ex.cell(line,'C').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'C').to_i
#       puts "Basic..................Salary"

#       elsif t.salary_component.name == "HRA"
#       est.monthly_amount = ex.cell(line,'D') unless ex.cell(line,'D').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'D').to_i
#       puts "HRA..................Salary"

#       elsif t.salary_component.name == "Conveyance Allowance"
#       est.monthly_amount = ex.cell(line,'E') unless ex.cell(line,'E').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'E').to_i
#       puts "Convenience Allowance..................Salary"

#       elsif t.salary_component.name == "Other Allowance"
#       est.monthly_amount = ex.cell(line,'F') unless ex.cell(line,'F').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'F').to_i
#       puts "Medical Allowance.......................Salary"

#       elsif t.salary_component.name == "LTA"
#       est.monthly_amount = ex.cell(line,'G') unless ex.cell(line,'G').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'G').to_i

#       puts "LT Allowance..................Salary"


#       elsif t.salary_component.name == "Medical Allowance"
#       est.monthly_amount = ex.cell(line,'H') unless ex.cell(line,'H').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'H').to_i
#       puts "Edu All..................Salary"

#       elsif t.salary_component.name == "Special Allowance"
#       est.monthly_amount = ex.cell(line,'I') unless ex.cell(line,'I').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'I').to_i
#       puts "Prog All.......................Salary"
#     end
#       est.save!
#       puts "#{j} component inserted..."
#       j=j+1
#     end
#   end
#   gross_salary = 0
# end
# end



# ex = Roo::Excel.new("#{Rails.root}/public/ctc.xls")
# ex.default_sheet = ex.sheets[1]
# j = 1
# gross_salary = 0
# ActiveRecord::Base.transaction do
# 2.upto(24) do |line|
#   puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"

#   @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_s)
# >>>>>>> 5dd99c479691f2d05532308a161eaba9356e35db
 
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
    
# <<<<<<< HEAD
#       if t.salary_component.name == "Basic"
#       est.monthly_amount = ex.cell(line,'D') unless ex.cell(line,'D').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'D').to_i
#       puts "Basic..................Salary"

#       elsif t.salary_component.name == "HRA"
#       est.monthly_amount = ex.cell(line,'E') unless ex.cell(line,'E').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'E').to_i
#       puts "HRA..................Salary"

#       elsif t.salary_component.name == "Special Allowance"
#       est.monthly_amount = ex.cell(line,'F') unless ex.cell(line,'F').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'F').to_i
#       puts "Convenience Allowance..................Salary"

#       # elsif t.salary_component.name == "Other Allowance"
#       # est.monthly_amount = ex.cell(line,'F') unless ex.cell(line,'F').nil?
#       # est.annual_amount = est.monthly_amount.to_i * 12
#       # gross_salary = gross_salary + ex.cell(line,'F').to_i
#       # puts "Medical Allowance.......................Salary"

#       # elsif t.salary_component.name == "LTA"
#       # est.monthly_amount = ex.cell(line,'G') unless ex.cell(line,'G').nil?
#       # est.annual_amount = est.monthly_amount.to_i * 12
#       # gross_salary = gross_salary + ex.cell(line,'G').to_i

#       # puts "LT Allowance..................Salary"


#       # elsif t.salary_component.name == "Medical Allowance"
#       # est.monthly_amount = ex.cell(line,'H') unless ex.cell(line,'H').nil?
#       # est.annual_amount = est.monthly_amount.to_i * 12
#       # gross_salary = gross_salary + ex.cell(line,'H').to_i
#       # puts "Edu All..................Salary"

#       # elsif t.salary_component.name == "Special Allowance"
#       # est.monthly_amount = ex.cell(line,'I') unless ex.cell(line,'I').nil?
#       # est.annual_amount = est.monthly_amount.to_i * 12
#       # gross_salary = gross_salary + ex.cell(line,'I').to_i
#       # puts "Prog All.......................Salary"
# =======
#       if t.salary_component.name == "Stipend"
#       est.monthly_amount = ex.cell(line,'C') unless ex.cell(line,'C').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'C').to_i
#       puts "Basic..................Salary"

    
    
# >>>>>>> 5dd99c479691f2d05532308a161eaba9356e35db
#     end
#       est.save!
#       puts "#{j} component inserted..."
#       j=j+1
#     end
#   end
#   gross_salary = 0
# end
# <<<<<<< HEAD
# end
# =======
# end

# >>>>>>> 5dd99c479691f2d05532308a161eaba9356e35db
