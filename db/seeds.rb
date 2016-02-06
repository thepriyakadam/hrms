require 'rubygems'
require 'roo'

ex = Roo::Excel.new("#{Rails.root}/public/salary_template.xls")
ex.default_sheet = ex.sheets[1]
j = 1
gross_salary = 0
2.upto(96) do |line|
  puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
  @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
  
  @salary_template = SalaryTemplate.find_by_code(ex.cell(line,'B'))
  @salary_component_templates = @salary_template.salary_component_templates unless @salary_template.nil?

  EmployeeTemplate.create(employee_id: @employee.id, salary_template_id: @salary_template.id, start_date: Date.today)

  @salary_component_templates.each do |t|
    EmployeeSalaryTemplate.new do |est|
      have_esic = @employee.joining_detail.have_esic
      est.employee_id = @employee.id
      est.salary_template_id = @salary_template.id
      est.salary_component_id = t.salary_component_id 
      est.is_deducted = t.is_deducted
      est.parent_salary_component_id
      est.percentage = t.is_deducted
      est.to_be_paid = t.to_be_paid
      est.employee_template_id = EmployeeTemplate.last.id
      
      if t.salary_component.name == "Basic"
      est.monthly_amount = ex.cell(line,'C') unless ex.cell(line,'C').nil?
      est.annual_amount = est.monthly_amount.to_i * 12
      gross_salary = gross_salary + ex.cell(line,'C').to_i
      elsif t.salary_component.name == "HRA"
      est.monthly_amount = ex.cell(line,'D') unless ex.cell(line,'D').nil?
      est.annual_amount = est.monthly_amount.to_i * 12
      gross_salary = gross_salary + ex.cell(line,'D').to_i
      elsif t.salary_component.name == "Special Allowance"
      est.monthly_amount = ex.cell(line,'E') unless ex.cell(line,'E').nil?
      est.annual_amount = est.monthly_amount.to_i * 12
      gross_salary = gross_salary + ex.cell(line,'E').to_i
      elsif t.salary_component.name == "Convenience Allowance"
      est.monthly_amount = ex.cell(line,'F') unless ex.cell(line,'F').nil?
      est.annual_amount = est.monthly_amount.to_i * 12
      gross_salary = gross_salary + ex.cell(line,'F').to_i
      elsif t.salary_component.name == "Other Allowance"
      est.monthly_amount = ex.cell(line,'G') unless ex.cell(line,'G').nil?
      est.annual_amount = est.monthly_amount.to_i * 12
      gross_salary = gross_salary.to_i + ex.cell(line,'G').to_i
      elsif t.salary_component.name == "Washing Allowance"
      est.monthly_amount = ex.cell(line,'H') unless ex.cell(line,'H').nil?
      est.annual_amount = est.monthly_amount.to_i * 12
      gross_salary = gross_salary + ex.cell(line,'H').to_i
      elsif t.salary_component.name == "DA"
      est.monthly_amount = ex.cell(line,'I') unless ex.cell(line,'I').nil?
      est.annual_amount = est.monthly_amount.to_i * 12
      gross_salary = gross_salary + ex.cell(line,'I').to_i
      elsif t.salary_component.name == "Medical Allowance"
      est.monthly_amount = ex.cell(line,'J') unless ex.cell(line,'J').nil?
      est.annual_amount = est.monthly_amount.to_i * 12
      gross_salary = gross_salary + ex.cell(line,'J').to_i
      elsif t.salary_component.name == "Driver Allowance"
      est.monthly_amount = ex.cell(line,'K') unless ex.cell(line,'K').nil?
      est.annual_amount = est.monthly_amount.to_i * 12
      gross_salary = gross_salary + ex.cell(line,'K').to_i
      elsif t.salary_component.name == "Rembursement of medical exp."
      est.monthly_amount = ex.cell(line,'L') unless ex.cell(line,'L').nil?
      est.annual_amount = est.monthly_amount.to_i * 12
      gross_salary = gross_salary + ex.cell(line,'L').to_i
      elsif t.salary_component.name == "Children Education Allowance"
      est.monthly_amount = ex.cell(line,'M') unless ex.cell(line,'M').nil?
      est.annual_amount = est.monthly_amount.to_i * 12
      gross_salary = gross_salary + ex.cell(line,'M').to_i
      elsif t.salary_component.name == "PF"
      est.monthly_amount = (ex.cell(line,'C')/100) * 12 unless ex.cell(line,'C').nil?
      est.annual_amount = est.monthly_amount.to_i * 12
      elsif t.salary_component.name == "ESIC"
        if have_esic and gross_salary <= 15000
          temp = gross_salary - ex.cell(line,'H')
          est.monthly_amount = (temp / 100 * 1.75).round 
        else
          est.monthly_amount = 0
        end
      est.annual_amount = est.monthly_amount.to_i * 12
      elsif t.salary_component.name == "Income Tax"
      est.monthly_amount = ex.cell(line,'N') unless ex.cell(line,'N').nil?
      est.annual_amount = est.monthly_amount.to_i * 12
      elsif t.salary_component.name == "Food Deduction"
      est.monthly_amount = ex.cell(line,'O') unless ex.cell(line,'O').nil?
      est.annual_amount = est.monthly_amount.to_i * 12
      elsif t.salary_component.name == "Other Deduction"
      est.monthly_amount = ex.cell(line,'P') unless ex.cell(line,'P').nil?
      est.annual_amount = est.monthly_amount.to_i * 12
      elsif t.salary_component.name == "Mobile Deduction"
      est.monthly_amount = ex.cell(line,'Q') unless ex.cell(line,'Q').nil?
      est.annual_amount = est.monthly_amount.to_i * 12
      elsif t.salary_component.name == "Society"
      est.monthly_amount = ex.cell(line,'R') unless ex.cell(line,'R').nil?
      est.annual_amount = est.monthly_amount.to_i * 12
      elsif t.salary_component.name == "Prof. Tax"
      est.monthly_amount = ex.cell(line,'S') unless ex.cell(line,'S').nil?
      est.annual_amount = est.monthly_amount.to_i * 12
      end
      est.save!
      puts "#{j} component inserted..."
      j=j+1
    end
  end
  gross_salary = 0
end