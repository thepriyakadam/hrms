
require 'rubygems'
require 'roo'


# ex = Roo::Excel.new("#{Rails.root}/public/final sheet.xls")
# ex.default_sheet = ex.sheets[0]
# j = 1
# gross_salary = 0
# ActiveRecord::Base.transaction do
# 2.upto(189) do |line|
#   puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"

#   @employee = Employee.find_by_manual_employee_code(ex.cell(line,'B').to_i)
 
#   @salary_template = SalaryTemplate.find_by_id(ex.cell(line,'L'))
#   @salary_component_templates = @salary_template.salary_component_templates unless @salary_template.nil?

#   EmployeeTemplate.create(employee_id: @employee.try(:id), salary_template_id: @salary_template.try(:id), start_date: Date.today)

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
#       est.monthly_amount = ex.cell(line,'D') unless ex.cell(line,'D').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'D').to_i
#       puts "Basic..................Salary"

#       elsif t.salary_component.name == "HRA"
#       est.monthly_amount = ex.cell(line,'E') unless ex.cell(line,'E').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'E').to_i
#       puts "HRA..................Salary"

#       elsif t.salary_component.name == "Convenience Allowance"
#       est.monthly_amount = ex.cell(line,'F') unless ex.cell(line,'F').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'F').to_i
#       puts "Convenience Allowance..................Salary"

#       elsif t.salary_component.name == "Medical Allowance"
#       est.monthly_amount = ex.cell(line,'G') unless ex.cell(line,'G').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'G').to_i
#       puts "Medical Allowance.......................Salary"

#       elsif t.salary_component.name == "Leave Travel Allowance"
#       est.monthly_amount = ex.cell(line,'H') unless ex.cell(line,'H').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'H').to_i

#       puts "LT Allowance..................Salary"


#       elsif t.salary_component.name == "Children Education Allowance"
#       est.monthly_amount = ex.cell(line,'I') unless ex.cell(line,'I').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'I').to_i
#       puts "Edu All..................Salary"

#       elsif t.salary_component.name == "Progressive Allowance"
#       est.monthly_amount = ex.cell(line,'J') unless ex.cell(line,'J').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'J').to_i
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

# ex = Roo::Excel.new("#{Rails.root}/public/14.Food Deduction Detail.xls")
#  ex.default_sheet = ex.sheets[0] #siya feb
#  i = 1
#  ActiveRecord::Base.transaction do
#  2.upto(41) do |line| # siya Feb 201
#    puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
#    @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
#    unless @employee.nil?
#  puts "Starting Record............. #{ex.cell(line,'H')}---------------------------------------"
#      FoodDeduction.new do |w|
#       puts "Starting Record............. #{ex.cell(line,'H')}----------vishal-----------------------------"
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
