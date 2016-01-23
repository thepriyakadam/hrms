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


puts "Starting ..."
ex = Roo::Excel.new("#{Rails.root}/public/final.xls")
ex.default_sheet = ex.sheets[1] 
i=1

3.upto(491) do |line|
Employee.new do |e|
  e.manual_employee_code = ex.cell(line,'A').to_i
  e.first_name = ex.cell(line,'B')
  e.middle_name = ex.cell(line,'C')
  e.last_name = ex.cell(line,'D')
  e.gender = ex.cell(line,'E')
  @religion = Religion.find_by_name(ex.cell(line,'F'))
  e.religion_id = @religion.id unless @religion.nil?
  e.date_of_birth = ex.cell(line,'G')
  e.permanent_address = ex.cell(line,'H')
  e.pin_code = ex.cell(line,'I')
  @country = Country.find_by_name(ex.cell(line,'J'))
  e.country_id = @country.id unless @country.nil?
  @state = State.find_by_name(ex.cell(line,'K'))
  e.state_id = @state.id unless @state.nil?
  @district = District.find_by_name(ex.cell(line,'L'))
  e.district_id =  @district.id unless @district.nil?
  e.city = ex.cell(line,'M')
  e.current_address = ex.cell(line,'N')
  e.contact_no = ex.cell(line,'O')
  e.email = ex.cell(line,'P')
  @type = EmployeeType.find_by_name(ex.cell(line,'Q'))
  e.employee_type_id = @type.id unless @type.nil?
  e.status = ex.cell(line,'R')
  e.handicap = ex.cell(line,'S')
  e.handicap_type = ex.cell(line, 'T')
  e.save!
end


@employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
JoiningDetail.new do |j|
  j.employee_id = @employee.id unless @employee.nil?
  j.joining_date = ex.cell(line,'U')

  @grade = EmployeeGrade.find_by_name(ex.cell(line,'V'))
  j.employee_grade_id = @grade.id unless @grade.nil?

  @category = EmployeeCategory.find_by_name(ex.cell(line,'W'))
  j.employee_category_id = @category.id unless @category.nil?

  @designation = EmployeeDesignation.find_by_name(ex.cell(line,'X'))
  j.employee_designation_id = @designation.id unless @designation.nil?
  
  j.confirmation_date = ex.cell(line,'Y')
  j.employee_uan_no = ex.cell(line,'Z')

  j.select_pf = ex.cell(line,'AA')

  j.employee_pf_no = ex.cell(line,'AB')
  j.pf_max_amount = ex.cell(line,'AC')

  j.have_esic = ex.cell(line,'AD')

  j.employee_efic_no = ex.cell(line,'AE')
  j.payment_mode = ex.cell(line,'AF')
  @cost_center = CostCenter.find_by_name(ex.cell(line,'AG'))
  j.cost_center_id = @cost_center.id unless @cost_center.nil?


  j.medical_schem = ex.cell(line,'AH')
  j.passport_no = ex.cell(line,'AI')
  j.passport_issue_date = ex.cell(line,'AJ')
  j.passport_expiry_date = ex.cell(line,'AK')

  j.probation_period = ex.cell(line,'AL')
  j.notice_period = ex.cell(line,'AM')
  j.save!
end

EmployeeBankDetail.new do |b|
  b.employee_id = @employee.id unless @employee.nil?
  b.account_no = ex.cell(line,'AN')
  b.bank_name = ex.cell(line,'AO')
  b.branch_name = ex.cell(line,'AP')
  b.address = ex.cell(line,'AQ')
  b.contact_no = ex.cell(line,'AR')
  b.micr_code = ex.cell(line,'AS')
  b.branch_code = ex.cell(line,'AT')
  b.ifsc_code = ex.cell(line,'AU')
  b.save!
end
puts "#{i} Record inserted.-----------------------------------------------"
i = i+1

end


# ex = Roo::Excel.new("#{Rails.root}/public/test.xls")
# ex.default_sheet = ex.sheets[2]

# 2.upto(21) do |line|
#   puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
#   @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
#   @salary_template = SalaryTemplate.find_by_code(ex.cell(line,'B'))
#   @salary_component_templates = @salary_template.salary_component_templates
#   j = 1
#   @salary_component_templates.each do |t|
#     EmployeeSalaryTemplate.new do |est|
#       est.employee_id = @employee.id
#       est.salary_template_id = @salary_template.id
#       est.salary_component_id = t.salary_component_id 
#       est.is_deducted = t.is_deducted
#       est.parent_salary_component_id
#       est.percentage = t.is_deducted
#       est.to_be_paid = t.to_be_paid
#       if t.salary_component.name == "Basic"
#       est.monthly_amount = ex.cell(line,'P')
#       est.annual_amount = est.monthly_amount.to_i * 12
#       elsif t.salary_component.name == "HRA"
#       est.monthly_amount = ex.cell(line,'Q')
#       est.annual_amount = est.monthly_amount.to_i * 12
#       elsif t.salary_component.name == "Special Allowance"
#       est.monthly_amount = ex.cell(line,'R')
#       est.annual_amount = est.monthly_amount.to_i * 12
#       elsif t.salary_component.name == "Convenience Allowance"
#       est.monthly_amount = ex.cell(line,'S')
#       est.annual_amount = est.monthly_amount.to_i * 12
#       elsif t.salary_component.name == "Other Allowance"
#       est.monthly_amount = ex.cell(line,'T')
#       est.annual_amount = est.monthly_amount.to_i * 12
#       elsif t.salary_component.name == "Washing Allowance"
#       est.monthly_amount = ex.cell(line,'U')
#       est.annual_amount = est.monthly_amount.to_i * 12
#       elsif t.salary_component.name == "DA"
#       est.monthly_amount = ex.cell(line,'V')
#       est.annual_amount = est.monthly_amount.to_i * 12
#       elsif t.salary_component.name == "Medical Allowance"
#       est.monthly_amount = ex.cell(line,'W')
#       est.annual_amount = est.monthly_amount.to_i * 12
#       elsif t.salary_component.name == "Driver Allowance"
#       est.monthly_amount = ex.cell(line,'X')
#       est.annual_amount = est.monthly_amount.to_i * 12
#       elsif t.salary_component.name == "Rembursement of medical exp."
#       est.monthly_amount = ex.cell(line,'Y')
#       est.annual_amount = est.monthly_amount.to_i * 12
#       elsif t.salary_component.name == "Children Education Allowance"
#       est.monthly_amount = ex.cell(line,'Z')
#       est.annual_amount = est.monthly_amount.to_i * 12
#       elsif t.salary_component.name == "PF"
#       est.monthly_amount = ex.cell(line,'AN')
#       est.annual_amount = est.monthly_amount.to_i * 12
#       elsif t.salary_component.name == "ESIC"
#       est.monthly_amount = ex.cell(line,'AO')
#       est.annual_amount = est.monthly_amount.to_i * 12
#       elsif t.salary_component.name == "Income Tax"
#       est.monthly_amount = ex.cell(line,'AP')
#       est.annual_amount = est.monthly_amount.to_i * 12
#       elsif t.salary_component.name == "Food Deduction"
#       est.monthly_amount = ex.cell(line,'AQ')
#       est.annual_amount = est.monthly_amount.to_i * 12
#       elsif t.salary_component.name == "Other Deducation"
#       est.monthly_amount = ex.cell(line,'AR')
#       est.annual_amount = est.monthly_amount.to_i * 12
#       elsif t.salary_component.name == "Society"
#       est.monthly_amount = ex.cell(line,'AT')
#       est.annual_amount = est.monthly_amount.to_i * 12
#       elsif t.salary_component.name == "Prof. Tax"
#       est.monthly_amount = ex.cell(line,'AU')
#       est.annual_amount = est.monthly_amount.to_i * 12
#       end
#       est.save!
#       j=j+1
#       puts "#{j} component inserted..."
#     end
#   end
# end

# Workingday.new do |w|
#   w.employee_id = @employee.id
#   w.month_name = ex.cell(line,'D')
#   w.year = 
#   w.day_in_month
#   w.present_day
#   w.total_leave
#   w.holiday_in_month
#   w.week_of_day
#   w.absent_day
#   w.payble_day
# end