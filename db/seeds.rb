require 'rubygems'
require 'roo'
# # company_type_array = ['Information Technology','Finance','Chemical','Production']

# # company_type_array.each do |ct|
# # 	company_type = CompanyType.find_or_initialize_by(name: ct)
# # 	company_type.name = ct
# # 	company_type.save
# # end

# emp_type = ['Temporary','Permanent']
# emp_type.each do |e|
# 	EmployeeType.create(name: e)
# end

# natinality = ['Indian','US','UK']
# natinality.each do |n|
# 	Nationality.create(name: n)
# end

# blood_group = ['A+','B+','AB+','O+','A-','B-','AB-','O-']
# blood_group.each do |d|
# 	BloodGroup.create(name: d)
# end

# # employee_grade = ['G1','G2','G3','G4']
# # employee_grade.each do |d|
# # 	EmployeeGrade.create(name: d)
# # end

# roles = ['Company','CompanyLocation','Department','Employee']
# roles.each do |r|
# 	Role.create(name: r)
# end

# degrees =['SSC','HSC','DEPLOMA','ITI','BA','BSC','BCA','B.COM','BE','B.TECH','BBA','MA','MSC','MCA','M.COM','ME','M.TECH','MBA']
# degrees.each do |d|
# 	Degree.create(name:d)
# end

# degree_types =['SSC','HSC','DEPLOMA','Under Graduation','Post Graduation','Ph.ed']
# degree_types.each do |d|
# 	DegreeType.create(name:d)
# end

# degree_streams =['Electrical','Mechanical','IT','COMPUTER']
# degree_streams.each do |d|
# 	DegreeStream.create(name:d)
# end

# puts 'Year Started...'
# for i in 1960..Date.today.year
# 	Year.create(name:i)
# end

# puts 'Countries Started...'
# CS.countries.each {|k,v| Country.create(code: k, name: v)}
# puts 'States Started...'
# CS.states(:in).each {|k,v| c = Country.find_by_code('IN'); c.states.create(code: k,name: v)}
# puts 'District Started...'
# CS.states(:in).each {|k,v| s = State.find_by_code(k); CS.cities(k,:in).each {|c| s.districts.create(name: c)}}


# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/employee.xls")
# ex.default_sheet = ex.sheets[1] 
# i=1

# 3.upto(491) do |line|
# Employee.new do |e|
#   e.manual_employee_code = ex.cell(line,'A').to_i
#   e.first_name = ex.cell(line,'B')
#   e.middle_name = ex.cell(line,'C')
#   e.last_name = ex.cell(line,'D')
#   e.gender = ex.cell(line,'E')
#   @religion = Religion.find_by_name(ex.cell(line,'F'))
#   e.religion_id = @religion.id unless @religion.nil?
#   e.date_of_birth = ex.cell(line,'G')
#   e.permanent_address = ex.cell(line,'H')
#   e.pin_code = ex.cell(line,'I').to_i
#   @country = Country.find_by_name(ex.cell(line,'J'))
#   e.country_id = @country.id unless @country.nil?
#   @state = State.find_by_name(ex.cell(line,'K'))
#   e.state_id = @state.id unless @state.nil?
#   @district = District.find_by_name(ex.cell(line,'L'))
#   e.district_id =  @district.id unless @district.nil?
#   e.city = ex.cell(line,'M')
#   e.current_address = ex.cell(line,'N')
#   e.contact_no = ex.cell(line,'O').to_i
#   e.email = ex.cell(line,'P')
#   @type = EmployeeType.find_by_name(ex.cell(line,'Q'))
#   e.employee_type_id = @type.id unless @type.nil?
#   e.status = ex.cell(line,'R')
#   e.handicap = ex.cell(line,'S')
#   e.handicap_type = ex.cell(line, 'T')
#   e.save!
# end

# @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
# JoiningDetail.new do |j|
#   j.employee_id = @employee.id unless @employee.nil?
#   j.joining_date = ex.cell(line,'U')

#   @grade = EmployeeGrade.find_by_name(ex.cell(line,'V'))
#   j.employee_grade_id = @grade.id unless @grade.nil?

#   @category = EmployeeCategory.find_by_name(ex.cell(line,'W'))
#   j.employee_category_id = @category.id unless @category.nil?

#   @designation = EmployeeDesignation.find_by_name(ex.cell(line,'X'))
#   j.employee_designation_id = @designation.id unless @designation.nil?
  
#   j.confirmation_date = ex.cell(line,'Y')
#   j.employee_uan_no = ex.cell(line,'Z')

#   j.select_pf = ex.cell(line,'AA')

#   j.employee_pf_no = ex.cell(line,'AB').to_i
#   j.pf_max_amount = ex.cell(line,'AC')
#     if ex.cell(line,'AD') == "Yes"
#       j.have_esic = true
#     else
#       j.have_esic = false
#     end
  
#   j.employee_efic_no = ex.cell(line,'AE').to_i
#   j.payment_mode = ex.cell(line,'AF')
#   @cost_center = CostCenter.find_by_name(ex.cell(line,'AG'))
#   j.cost_center_id = @cost_center.id unless @cost_center.nil?


#   j.medical_schem = ex.cell(line,'AH')
#   j.passport_no = ex.cell(line,'AI')
#   j.passport_issue_date = ex.cell(line,'AJ')
#   j.passport_expiry_date = ex.cell(line,'AK')

#   j.probation_period = ex.cell(line,'AL')
#   j.notice_period = ex.cell(line,'AM')
#   j.save!
# end

# EmployeeBankDetail.new do |b|
#   b.employee_id = @employee.id unless @employee.nil?
#   b.account_no = ex.cell(line,'AN').to_i
#   b.bank_name = ex.cell(line,'AO')
#   b.branch_name = ex.cell(line,'AP')
#   b.address = ex.cell(line,'AQ')
#   b.contact_no = ex.cell(line,'AR').to_i
#   b.micr_code = ex.cell(line,'AS')
#   b.branch_code = ex.cell(line,'AT')
#   b.ifsc_code = ex.cell(line,'AU')
#   b.save!
# end

# puts "#{i} Record inserted.-----------------------------------------------"
# i = i+1
# end



ex = Roo::Excel.new("#{Rails.root}/public/payroll.xls")
ex.default_sheet = ex.sheets[0]
j = 1
gross_salary = 0
2.upto(456) do |line|
  puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
  @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
  
  @salary_template = SalaryTemplate.find_by_code(ex.cell(line,'B'))
  @salary_component_templates = @salary_template.salary_component_templates unless @salary_template.nil?
  
  Workingday.new do |w|
    w.employee_id = @employee.id
    w.month_name = ex.cell(line,'F')
    w.year = ex.cell(line,'G').to_i
    w.day_in_month = ex.cell(line, 'AX')
    w.present_day = ex.cell(line, 'AY')
    w.holiday_in_month = ex.cell(line, 'AZ')
    total_leave = ex.cell(line, 'AT').to_i+ex.cell(line, 'AU').to_i+ex.cell(line, 'AV').to_i+ex.cell(line, 'AW').to_i
    w.total_leave = total_leave 
    w.week_off_day = ex.cell(line, 'BA')
    w.absent_day = ex.cell(line, 'BB')
    w.payable_day = ex.cell(line, 'BC')
    w.save!
  end

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
      
      if t.salary_component.name == "Basic"
      est.monthly_amount = ex.cell(line,'H') unless ex.cell(line,'H').nil?
      est.annual_amount = est.monthly_amount.to_i * 12
      gross_salary = gross_salary + ex.cell(line,'H').to_i
      elsif t.salary_component.name == "HRA"
      est.monthly_amount = ex.cell(line,'I') unless ex.cell(line,'I').nil?
      est.annual_amount = est.monthly_amount.to_i * 12
      gross_salary = gross_salary + ex.cell(line,'I').to_i
      elsif t.salary_component.name == "Special Allowance"
      est.monthly_amount = ex.cell(line,'J') unless ex.cell(line,'J').nil?
      est.annual_amount = est.monthly_amount.to_i * 12
      gross_salary = gross_salary + ex.cell(line,'J').to_i
      elsif t.salary_component.name == "Convenience Allowance"
      est.monthly_amount = ex.cell(line,'K') unless ex.cell(line,'K').nil?
      est.annual_amount = est.monthly_amount.to_i * 12
      gross_salary = gross_salary + ex.cell(line,'K').to_i
      elsif t.salary_component.name == "Other Allowance"
      est.monthly_amount = ex.cell(line,'L') unless ex.cell(line,'L').nil?
      est.annual_amount = est.monthly_amount.to_i * 12
      gross_salary = gross_salary.to_i + ex.cell(line,'L').to_i
      elsif t.salary_component.name == "Washing Allowance"
      est.monthly_amount = ex.cell(line,'M') unless ex.cell(line,'M').nil?
      est.annual_amount = est.monthly_amount.to_i * 12
      gross_salary = gross_salary + ex.cell(line,'M').to_i
      elsif t.salary_component.name == "DA"
      est.monthly_amount = ex.cell(line,'N') unless ex.cell(line,'N').nil?
      est.annual_amount = est.monthly_amount.to_i * 12
      gross_salary = gross_salary + ex.cell(line,'N').to_i
      elsif t.salary_component.name == "Medical Allowance"
      est.monthly_amount = ex.cell(line,'O') unless ex.cell(line,'O').nil?
      est.annual_amount = est.monthly_amount.to_i * 12
      gross_salary = gross_salary + ex.cell(line,'O').to_i
      elsif t.salary_component.name == "Driver Allowance"
      est.monthly_amount = ex.cell(line,'P') unless ex.cell(line,'P').nil?
      est.annual_amount = est.monthly_amount.to_i * 12
      gross_salary = gross_salary + ex.cell(line,'P').to_i
      elsif t.salary_component.name == "Rembursement of medical exp."
      est.monthly_amount = ex.cell(line,'Q') unless ex.cell(line,'Q').nil?
      est.annual_amount = est.monthly_amount.to_i * 12
      gross_salary = gross_salary + ex.cell(line,'Q').to_i
      elsif t.salary_component.name == "Children Education Allowance"
      est.monthly_amount = ex.cell(line,'R') unless ex.cell(line,'R').nil?
      est.annual_amount = est.monthly_amount.to_i * 12
      gross_salary = gross_salary + ex.cell(line,'R').to_i
      elsif t.salary_component.name == "PF"
      est.monthly_amount = (ex.cell(line,'H')/100) * 12 unless ex.cell(line,'H').nil?
      est.annual_amount = est.monthly_amount.to_i * 12
      elsif t.salary_component.name == "ESIC"
        if have_esic and gross_salary <= 15000
          temp = gross_salary - ex.cell(line,'M')
          est.monthly_amount = (temp / 100 * 1.75).round 
        else
          est.monthly_amount = 0
        end
      est.annual_amount = est.monthly_amount.to_i * 12
      elsif t.salary_component.name == "Income Tax"
      est.monthly_amount = ex.cell(line,'AH') unless ex.cell(line,'AH').nil?
      est.annual_amount = est.monthly_amount.to_i * 12
      elsif t.salary_component.name == "Food Deduction"
      est.monthly_amount = ex.cell(line,'AI') unless ex.cell(line,'AI').nil?
      est.annual_amount = est.monthly_amount.to_i * 12
      elsif t.salary_component.name == "Other Deduction"
      est.monthly_amount = ex.cell(line,'AJ') unless ex.cell(line,'AJ').nil?
      est.annual_amount = est.monthly_amount.to_i * 12
      elsif t.salary_component.name == "Society"
      est.monthly_amount = ex.cell(line,'AL') unless ex.cell(line,'AL').nil?
      est.annual_amount = est.monthly_amount.to_i * 12
      elsif t.salary_component.name == "Prof. Tax"
      est.monthly_amount = ex.cell(line,'AP') unless ex.cell(line,'AP').nil?
      est.annual_amount = est.monthly_amount.to_i * 12
      end
      est.save!
      puts "#{j} component inserted..."
      j=j+1
    end
  end
  gross_salary = 0
end


ex = Roo::Excel.new("#{Rails.root}/public/payroll.xls")
ex.default_sheet = ex.sheets[0]
j = 1
2.upto(91) do |line|
  puts "Starting Record---------------------------------------"
  @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
  
  
  AdvanceSalary.new do |a|
    a.employee_id = @employee.id unless @employee.nil? 
    a.advance_amount = ex.cell(line,'A')
    a.no_of_instalment = ex.cell(line,'A').to_i
    a.instalment_amount = a.advance_amount.to_i / a.no_of_instalment
    a.advance_date = ex.cell(line,'A')
    a.save!
  end

  @advance_salary = AdvanceSalary.find_by_employee_id(@employee.id)

  for i in 1..a.no_of_instalment
    Instalment.new do |i|
      i.advance_salary_id = @advance_salary.id
      #i.instalment_date = 
      i.instalment_amount = @advance_salary.instalment_amount
      i.save!
    end
  end

end

