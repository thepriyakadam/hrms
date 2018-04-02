
require 'rubygems'
require 'roo'

ex = Roo::Excel.new("#{Rails.root}/public/ctc.xls")
ex.default_sheet = ex.sheets[1]
j = 1
gross_salary = 0
ActiveRecord::Base.transaction do
2.upto(24) do |line|
  puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"

  @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A'))
 
  @salary_template = SalaryTemplate.find_by_id(ex.cell(line,'B'))
  @salary_component_templates = @salary_template.salary_component_templates unless @salary_template.nil?

  EmployeeTemplate.create(employee_id: @employee.try(:id), salary_template_id: @salary_template.id, start_date: Date.today)

  @salary_component_templates.each do |t|
    EmployeeSalaryTemplate.new do |est|
      est.employee_id = @employee.id
      est.salary_template_id = @salary_template.id
      est.salary_component_id = t.salary_component_id
      est.is_deducted = t.is_deducted
      est.parent_salary_component_id
      est.percentage = t.is_deducted
      est.to_be_paid = t.to_be_paid
      est.employee_template_id = EmployeeTemplate.last.id
    
      if t.salary_component.name == "Stipend"
      est.monthly_amount = ex.cell(line,'C') unless ex.cell(line,'C').nil?
      est.annual_amount = est.monthly_amount.to_i * 12
      gross_salary = gross_salary + ex.cell(line,'C').to_i
      puts "Basic..................Salary"  
    end
      est.save!
      puts "#{j} component inserted..."
      j=j+1
    end
  end
  gross_salary = 0
end
end
