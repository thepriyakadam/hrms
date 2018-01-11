require 'rubygems'
require 'roo'
ex = Roo::Excel.new("#{Rails.root}/public/advance.xls")
ex.default_sheet = ex.sheets[0]
j = 1
2.upto(38) do |line|
  puts "Starting Record---------------------------------------"
  @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
  
  unless @employee.nil?
    AdvanceSalary.new do |a|
      a.employee_id = @employee.id  
      a.advance_date = ex.cell(line,'C').to_date unless ex.cell(line,'C').nil?
      a.advance_amount = ex.cell(line,'D').to_f unless ex.cell(line,'D').nil?
      a.instalment_amount = ex.cell(line,'F').to_f unless ex.cell(line,'F').nil?
      #a.no_of_instalment = ex.cell(line,'E').to_i
      unless a.advance_amount.nil? and a.instalment_amount.nil?
      a.no_of_instalment = (a.advance_amount.to_i / a.instalment_amount).ceil
      end
      a.save!
    end

    @advance_salary = AdvanceSalary.find_by_employee_id(@employee.id)
    unless @advance_salary.nil?
      for i in 1..@advance_salary.no_of_instalment.to_i
        Instalment.new do |i|
          i.advance_salary_id = @advance_salary.id
          #i.instalment_date = 
          i.instalment_amount = @advance_salary.instalment_amount
          i.save!
        end
      end
    end
  end
end
# ex = Roo::Excel.new("#{Rails.root}/public/a.xls")
# ex.default_sheet = ex.sheets[0]
# j = 1
# gross_salary = 0
# ActiveRecord::Base.transaction do
# 2.upto(127) do |line|
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
#       est.monthly_amount = ex.cell(line,'E') unless ex.cell(line,'E').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'E').to_i
#       puts "Basic..................Salary"

#       elsif t.salary_component.name == "HRA"
#       est.monthly_amount = ex.cell(line,'F') unless ex.cell(line,'F').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'F').to_i
#       puts "HRA..................Salary"

#       elsif t.salary_component.name == "Convenience Allowance"
#       est.monthly_amount = ex.cell(line,'G') unless ex.cell(line,'G').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'G').to_i
#       puts "Convenience Allowance..................Salary"

#       elsif t.salary_component.name == "Medical Allowance"
#       est.monthly_amount = ex.cell(line,'H') unless ex.cell(line,'H').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'H').to_i
#       puts "Medical Allowance.......................Salary"

#       elsif t.salary_component.name == "Children Education Allowance"
#       est.monthly_amount = ex.cell(line,'I') unless ex.cell(line,'I').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'I').to_i

#       puts "Children Education Allowance..................Salary"


#       elsif t.salary_component.name == "Other Allowance"
#       est.monthly_amount = ex.cell(line,'J') unless ex.cell(line,'J').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'J').to_i
#       puts "Other Allowance..................Salary"

#       elsif t.salary_component.name == "Washing Allowance"
#       est.monthly_amount = ex.cell(line,'K') unless ex.cell(line,'K').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'K').to_i
#       puts "Washing Allowance.......................Salary"

#       elsif t.salary_component.name == "Newspaper"
#       est.monthly_amount = ex.cell(line,'L') unless ex.cell(line,'L').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'L').to_i
#       puts "Newspaper..................Salary"
#     end
#       est.save!
#       puts "#{j} component inserted..."
#       j=j+1
#     end
#   end
#   gross_salary = 0
# end
# end 