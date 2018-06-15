require 'rubygems'
require 'roo'

ex = Roo::Excel.new("#{Rails.root}/public/firstuttam.xls")
ex.default_sheet = ex.sheets[0]
j = 1
gross_salary = 0
ActiveRecord::Base.transaction do
2.upto(70) do |line|
  puts "Starting Record #{ex.cell(line,'')}---------------------------------------"

  @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
  puts "#{@employee.manual_employee_code}---------------------"
 
  @salary_template = SalaryTemplate.find_by_code(ex.cell(line,'B'))
  @salary_component_templates = @salary_template.salary_component_templates unless @salary_template.nil?

  EmployeeTemplate.create(employee_id: @employee.try(:id), salary_template_id: @salary_template.id, start_date: Date.today)

  @salary_component_templates.each do |t|
    EmployeeSalaryTemplate.new do |est|
      est.employee_id = @employee.id
      est.salary_template_id = @salary_template.id
      est.salary_component_id = t.salary_component_id
      est.is_deducted = t.is_deducted
      est.parent_salary_component_id
      est.percentage = t.percentage
      est.to_be_paid = t.to_be_paid
      est.employee_template_id = EmployeeTemplate.last.id
    
      if t.salary_component.name == "Basic"
      est.monthly_amount = ex.cell(line,'C') unless ex.cell(line,'C').nil?
      est.annual_amount = est.monthly_amount.to_i * 12
      gross_salary = gross_salary + ex.cell(line,'C').to_i
      puts "Basic..................Salary"

      elsif t.salary_component.name == "HRA"
      est.monthly_amount = ex.cell(line,'D') unless ex.cell(line,'D').nil?
      est.annual_amount = est.monthly_amount.to_i * 12
      gross_salary = gross_salary + ex.cell(line,'D').to_i
      puts "HRA..................Salary"

      elsif t.salary_component.name == "Performance Allowance"
      est.monthly_amount = ex.cell(line,'E') unless ex.cell(line,'E').nil?
      est.annual_amount = est.monthly_amount.to_i * 12
      gross_salary = gross_salary + ex.cell(line,'E').to_i
      puts "Performance Allowance..................Salary"

    end
      est.save!
      puts "#{j} component inserted..."
      j=j+1
    end
  end
  gross_salary = 0
end
end

