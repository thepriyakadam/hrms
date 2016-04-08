require 'rubygems'
require 'roo'

# ex = Roo::Excel.new("#{Rails.root}/public/employee_salary_template_dewas.xls")
# ex.default_sheet = ex.sheets[0]
# j = 1
# gross_salary = 0
# ActiveRecord::Base.transaction do
#   2.upto(372) do |line|
#   #375.upto(468) do |line|
#     puts "Starting Record #{ex.cell(line,'A')}--------------------------------------"
#     @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
    
#     @salary_template = SalaryTemplate.find_by_code(ex.cell(line,'B'))
#     @salary_component_templates = @salary_template.salary_component_templates unless @salary_template.nil?

#     employee_template_id = EmployeeTemplate.create(employee_id: @employee.id, salary_template_id: @salary_template.id, start_date: Date.today).id

#     @salary_component_templates.each do |t|
#       EmployeeSalaryTemplate.new do |est|
#         have_esic = @employee.joining_detail.have_esic
#         est.employee_id = @employee.id
#         est.salary_template_id = @salary_template.id
#         est.salary_component_id = t.salary_component_id
#         est.is_deducted = t.is_deducted
#         est.parent_salary_component_id
#         est.percentage = t.is_deducted
#         est.to_be_paid = t.to_be_paid
#         est.employee_template_id = employee_template_id
        
#         if t.salary_component.name == "Basic"
#         est.monthly_amount = ex.cell(line,'N') unless ex.cell(line,'N').nil?
#         est.annual_amount = est.monthly_amount.to_i * 12
#         elsif t.salary_component.name == "HRA"
#         est.monthly_amount = ex.cell(line,'O') unless ex.cell(line,'O').nil?
#         est.annual_amount = est.monthly_amount.to_i * 12
#         elsif t.salary_component.name == "Special Allowance"
#         est.monthly_amount = ex.cell(line,'P') unless ex.cell(line,'P').nil?
#         est.annual_amount = est.monthly_amount.to_i * 12
#         elsif t.salary_component.name == "Convenience Allowance"
#         est.monthly_amount = ex.cell(line,'Q') unless ex.cell(line,'Q').nil?
#         est.annual_amount = est.monthly_amount.to_i * 12
#         elsif t.salary_component.name == "Other Allowance"
#         est.monthly_amount = ex.cell(line,'R') unless ex.cell(line,'R').nil?
#         est.annual_amount = est.monthly_amount.to_i * 12
#         elsif t.salary_component.name == "Washing Allowance"
#         est.monthly_amount = ex.cell(line,'S') unless ex.cell(line,'S').nil?
#         est.annual_amount = est.monthly_amount.to_i * 12
#         elsif t.salary_component.name == "DA"
#         est.monthly_amount = ex.cell(line,'T') unless ex.cell(line,'I').nil?
#         est.annual_amount = est.monthly_amount.to_i * 12
#         end
#         est.save!
#         puts "#{j} component inserted..."
#         j=j+1
#       end
#     end
#     gross_salary = 0
#   end
# end
################################################################################################################################
# require 'rubygems'
# require 'roo'
# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/employe.xls")
# ex.default_sheet = ex.sheets[0]
# i=1
# 3.upto(510) do |line|
#   @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
#   unless @employee.nil?
#     @joining = JoiningDetail.find_by_employee_id(@employee.id)
#     unless @joining.nil?
#       @category = EmployeeCategory.find_by_name(ex.cell(line,'Z'))
#       unless @category.nil?
#         puts @category.name  
#         @joining.update(employee_category_id: @category.id)
#       end
      
#     end
#   end
# end

######################################################################################################3

# require 'rubygems'
# require 'roo'
# # company_type_array = ['Information Technology','Finance','Chemical','Production']

# # company_type_array.each do |ct|
# #   company_type = CompanyType.find_or_initialize_by(name: ct)
# #   company_type.name = ct
# #   company_type.save
# # end

# emp_type = ['Temporary','Permanent']
# emp_type.each do |e|
#   EmployeeType.create(name: e)
# end

# natinality = ['Indian','US','UK']
# natinality.each do |n|
#   Nationality.create(name: n)
# end

# blood_group = ['A+','B+','AB+','O+','A-','B-','AB-','O-']
# blood_group.each do |d|
#   BloodGroup.create(name: d)
# end

# # employee_grade = ['G1','G2','G3','G4']
# # employee_grade.each do |d|
# #   EmployeeGrade.create(name: d)
# # end

# roles = ['Company','CompanyLocation','Department','Employee']
# roles.each do |r|
#   Role.create(name: r)
# end

# degrees =['SSC','HSC','DEPLOMA','ITI','BA','BSC','BCA','B.COM','BE','B.TECH','BBA','MA','MSC','MCA','M.COM','ME','M.TECH','MBA']
# degrees.each do |d|
#   Degree.create(name:d)
# end

# degree_types =['SSC','HSC','DEPLOMA','Under Graduation','Post Graduation','Ph.ed']
# degree_types.each do |d|
#   DegreeType.create(name:d)
# end

# degree_streams =['Electrical','Mechanical','IT','COMPUTER']
# degree_streams.each do |d|
#   DegreeStream.create(name:d)
# end

# puts 'Year Started...'
# for i in 1960..Date.today.year
#   Year.create(name:i)
# end

# puts 'Countries Started...'
# CS.countries.each {|k,v| Country.create(code: k, name: v)}
# puts 'States Started...'
# CS.states(:in).each {|k,v| c = Country.find_by_code('IN'); c.states.create(code: k,name: v)}
# puts 'District Started...'
# CS.states(:in).each {|k,v| s = State.find_by_code(k); CS.cities(k,:in).each {|c| s.districts.create(name: c)}}

###############################################################################################
# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/employe.xls")
# ex.default_sheet = ex.sheets[0] 
# i=1

# 3.upto(510) do |line|
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
#   @nation = Nationality.find_by_name(ex.cell(line,'Q'))
#   e.nationality_id = @nation.id unless @nation.nil?
#   e.marital_status = ex.cell(line,'R')
#   @type = EmployeeType.find_by_name(ex.cell(line,'S'))
#   e.employee_type_id = @type.id unless @type.nil?
#   e.status = ex.cell(line,'T')
#   e.handicap = ex.cell(line,'U')
#   e.handicap_type = ex.cell(line, 'V')
#   e.save!
# end

# @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
# JoiningDetail.new do |j|
#   j.employee_id = @employee.id unless @employee.nil?
#   j.joining_date = ex.cell(line,'W')

#   @grade = EmployeeGrade.find_by_name(ex.cell(line,'X'))
#   j.employee_grade_id = @grade.id unless @grade.nil?

#   @department = Department.find_by_name(ex.cell(line,'Y'))
#   j.department_id = @department.id unless @department.nil?

#   @category = EmployeeCategory.find_by_name(ex.cell(line,'Z'))
#   j.employee_category_id = @category.id unless @category.nil?

#   @designation = EmployeeDesignation.find_by_name(ex.cell(line,'AA'))
#   j.employee_designation_id = @designation.id unless @designation.nil?
  
#   j.confirmation_date = ex.cell(line,'AB')
#   j.employee_uan_no = ex.cell(line,'AC')

#   j.select_pf = ex.cell(line,'AD')

#   j.employee_pf_no = ex.cell(line,'AE').to_i
#   j.pf_max_amount = ex.cell(line,'AF')
#     if ex.cell(line,'AG') == "Yes"
#       j.have_esic = true
#     else
#       j.have_esic = false
#     end
  
#   j.employee_efic_no = ex.cell(line,'AH').to_i
#   @mode = PaymentMode.find_by_name(ex.cell(line,'AI'))
#   j.payment_mode_id = @mode.id unless @mode.nil?
#   @cost_center = CostCenter.find_by_name(ex.cell(line,'AJ'))
#   j.cost_center_id = @cost_center.id unless @cost_center.nil?


#   j.medical_schem = ex.cell(line,'AK')
#   j.passport_no = ex.cell(line,'AL')
#   j.passport_issue_date = ex.cell(line,'AM')
#   j.passport_expiry_date = ex.cell(line,'AN')

#   j.probation_period = ex.cell(line,'AO')
#   j.notice_period = ex.cell(line,'AP')
#   j.save!
# end

# EmployeeBankDetail.new do |b|
#   b.employee_id = @employee.id unless @employee.nil?
#   b.account_no = ex.cell(line,'AQ').to_i
#   b.bank_name = ex.cell(line,'AR')
#   b.branch_name = ex.cell(line,'AS')
#   b.address = ex.cell(line,'AT')
#   b.contact_no = ex.cell(line,'AU').to_i
#   b.micr_code = ex.cell(line,'AV')
#   b.branch_code = ex.cell(line,'AW')
#   b.ifsc_code = ex.cell(line,'AX')
#   b.save!
# end

# puts "#{i} Record inserted.-----------------------------------------------"
# i = i+1
# end

###############################################################################################

# ex = Roo::Excel.new("#{Rails.root}/public/workingdays.xls")
# ex.default_sheet = ex.sheets[7]
# i = 1
# gross_salary = 0
# ActiveRecord::Base.transaction do
# #2.upto(372) do |line| 
# 367.upto(372) do |line| 
#   puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
#   @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
#   unless @employee.nil?
#     Workingday.new do |w|
#       w.employee_id = @employee.id
#       w.month_name = ex.cell(line,'B')
#       w.year = ex.cell(line,'C').to_i

#       w.lwp_leave = ex.cell(line, 'D').to_i
#       w.cl_leave = ex.cell(line, 'E').to_i
#       w.el_leave = ex.cell(line, 'F').to_i
#       w.esic_leave = ex.cell(line, 'G').to_i

#       w.day_in_month = ex.cell(line, 'H')
#       w.present_day = ex.cell(line, 'I')
#       w.holiday_in_month = ex.cell(line, 'J')
       
#       w.week_off_day = ex.cell(line, 'K')
#       w.absent_day = ex.cell(line, 'L')
#       w.payable_day = ex.cell(line, 'M')
#       w.save!
#     end
#     puts "#{i} Record inserted.-----------------------------------------------"
#     i = i+1
#   end
# end
# end
#####################################################################
# ex = Roo::Excel.new("#{Rails.root}/public/workingdays.xls")
# ex.default_sheet = ex.sheets[4]
# i = 1
# gross_salary = 0
# ActiveRecord::Base.transaction do
# #2.upto(372) do |line| # dewas jan 2016
# 2.upto(93) do |line| # siya jan 2016
# #2.upto(95) do |line| # siya Feb 2016
#   puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
#   @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
#   unless @employee.nil?
#     Workingday.new do |w|
#       w.employee_id = @employee.id
#       w.month_name = ex.cell(line,'B')
#       w.year = ex.cell(line,'C').to_i

#       w.lwp_leave = ex.cell(line, 'D').to_i
#       w.cl_leave = ex.cell(line, 'E').to_i
#       w.el_leave = ex.cell(line, 'F').to_i
#       w.esic_leave = ex.cell(line, 'G').to_i

#       w.day_in_month = ex.cell(line, 'H')
#       w.present_day = ex.cell(line, 'I')
#       w.holiday_in_month = ex.cell(line, 'J')
       
#       w.week_off_day = ex.cell(line, 'K')
#       w.absent_day = ex.cell(line, 'L')
#       w.payable_day = ex.cell(line, 'M')
#       w.save!
#     end
#     puts "#{i} Record inserted.-----------------------------------------------"
#     i = i+1
#   end
# end
# end

###############################################################################################

# ex = Roo::Excel.new("#{Rails.root}/public/salary_template.xls")
# ex.default_sheet = ex.sheets[0]
# j = 1
# gross_salary = 0
# 470.upto(488) do |line|
#   puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
#   @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
  
#   @salary_template = SalaryTemplate.find_by_code(ex.cell(line,'B'))
#   @salary_component_templates = @salary_template.salary_component_templates unless @salary_template.nil?

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
      
#       if t.salary_component.name == "Basic"
#       est.monthly_amount = ex.cell(line,'C') unless ex.cell(line,'C').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'C').to_i
#       elsif t.salary_component.name == "HRA"
#       est.monthly_amount = ex.cell(line,'D') unless ex.cell(line,'D').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'D').to_i
#       elsif t.salary_component.name == "Special Allowance"
#       est.monthly_amount = ex.cell(line,'E') unless ex.cell(line,'E').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'E').to_i
#       elsif t.salary_component.name == "Convenience Allowance"
#       est.monthly_amount = ex.cell(line,'F') unless ex.cell(line,'F').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'F').to_i
#       elsif t.salary_component.name == "Other Allowance"
#       est.monthly_amount = ex.cell(line,'G') unless ex.cell(line,'G').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary.to_i + ex.cell(line,'G').to_i
#       elsif t.salary_component.name == "Washing Allowance"
#       est.monthly_amount = ex.cell(line,'H') unless ex.cell(line,'H').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'H').to_i
#       elsif t.salary_component.name == "DA"
#       est.monthly_amount = ex.cell(line,'I') unless ex.cell(line,'I').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'I').to_i
#       elsif t.salary_component.name == "Medical Allowance"
#       est.monthly_amount = ex.cell(line,'J') unless ex.cell(line,'J').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'J').to_i
#       elsif t.salary_component.name == "Driver Allowance"
#       est.monthly_amount = ex.cell(line,'K') unless ex.cell(line,'K').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'K').to_i
#       elsif t.salary_component.name == "Rembursement of medical exp."
#       est.monthly_amount = ex.cell(line,'L') unless ex.cell(line,'L').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'L').to_i
#       elsif t.salary_component.name == "Children Education Allowance"
#       est.monthly_amount = ex.cell(line,'M') unless ex.cell(line,'M').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'M').to_i
#       elsif t.salary_component.name == "PF"
#       est.monthly_amount = (ex.cell(line,'C')/100) * 12 unless ex.cell(line,'C').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       elsif t.salary_component.name == "ESIC"
#         if have_esic and gross_salary <= 15000
#           temp = gross_salary - ex.cell(line,'H')
#           est.monthly_amount = (temp / 100 * 1.75).round 
#         else
#           est.monthly_amount = 0
#         end
#       est.annual_amount = est.monthly_amount.to_i * 12
#       elsif t.salary_component.name == "Income Tax"
#       est.monthly_amount = ex.cell(line,'AH') unless ex.cell(line,'AH').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       elsif t.salary_component.name == "Food Deduction"
#       est.monthly_amount = ex.cell(line,'AI') unless ex.cell(line,'AI').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       elsif t.salary_component.name == "Other Deduction"
#       est.monthly_amount = ex.cell(line,'AJ') unless ex.cell(line,'AJ').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       elsif t.salary_component.name == "Society"
#       est.monthly_amount = ex.cell(line,'AL') unless ex.cell(line,'AL').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       elsif t.salary_component.name == "Prof. Tax"
#       est.monthly_amount = ex.cell(line,'AP') unless ex.cell(line,'AP').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       end
#       est.save!
#       puts "#{j} component inserted..."
#       j=j+1
#     end
#   end
#   gross_salary = 0
# end

###############################################################################################

# ex = Roo::Excel.new("#{Rails.root}/public/advance.xls")
# ex.default_sheet = ex.sheets[0]
# j = 1
# 2.upto(38) do |line|
#   puts "Starting Record---------------------------------------"
#   @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
  
#   unless @employee.nil?
#     AdvanceSalary.new do |a|
#       a.employee_id = @employee.id  
#       a.advance_date = ex.cell(line,'C').to_date unless ex.cell(line,'C').nil?
#       a.advance_amount = ex.cell(line,'D').to_f unless ex.cell(line,'D').nil?
#       a.instalment_amount = ex.cell(line,'F').to_f unless ex.cell(line,'F').nil?
#       #a.no_of_instalment = ex.cell(line,'E').to_i
#       unless a.advance_amount.nil? and a.instalment_amount.nil?
#       a.no_of_instalment = (a.advance_amount.to_i / a.instalment_amount).ceil
#       end
#       a.save!
#     end

#     @advance_salary = AdvanceSalary.find_by_employee_id(@employee.id)
#     unless @advance_salary.nil?
#       for i in 1..@advance_salary.no_of_instalment.to_i
#         Instalment.new do |i|
#           i.advance_salary_id = @advance_salary.id
#           #i.instalment_date = 
#           i.instalment_amount = @advance_salary.instalment_amount
#           i.save!
#         end
#       end
#     end
#   end
# end

###############################################################################################################3

# ex = Roo::Excel.new("#{Rails.root}/public/deductions.xls")
# ex.default_sheet = ex.sheets[5]
# j = 1
# 2.upto(372) do |line|
#   puts "Starting Record---------------------------------------"
#   @employee = Employee.find_by_manual_employee_code(ex.cell(line,'B').to_i)
#   unless @employee.nil?
#     EmployeeSalaryTemplate.new do |a|
#       a.employee_id = @employee.id
#       a.salary_template_id = 9
#       a.salary_component_id = 15
#       a.is_deducted = true
#       a.monthly_amount = ex.cell(line,'J').to_i
#       a.save!
#     end

#     EmployeeSalaryTemplate.new do |a|
#       a.employee_id = @employee.id
#       a.salary_template_id = 9
#       a.salary_component_id = 23
#       a.is_deducted = true
#       a.monthly_amount = ex.cell(line,'L').to_i
#       a.save!
#     end

#     EmployeeSalaryTemplate.new do |a|
#       a.employee_id = @employee.id
#       a.salary_template_id = 9
#       a.salary_component_id = 18
#       a.is_deducted = true
#       a.monthly_amount = ex.cell(line,'M').to_i
#       a.save!
#     end
#   end
# end
##################################################################################################################
# ex = Roo::Excel.new("#{Rails.root}/public/role.xls")
# ex.default_sheet = ex.sheets[1]
# j = 1
# 2.upto(460) do |line|
#   puts "Starting Record---------------------------------------"
#   employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
#   unless employee.nil?
#     user = Member.new do |u|
#       if employee.email == "" or employee.email.nil?
#         u.email = "#{employee.employee_code}@xxx.com"
#       else
#         u.email = employee.email
#       end
#       u.password = '12345678'
#       u.employee_id = employee.id
#       u.department_id = employee.joining_detail.department_id
#       u.company_id = employee.company_location.company_id
#       u.company_location_id = employee.company_location_id
#       u.member_code = employee.employee_code
#       u.manual_member_code = employee.manual_employee_code
#       u.role_id = ex.cell(line,"D").to_i
#     end
#     ActiveRecord::Base.transaction do
#       if user.save
#         employee.update_attributes(department_id: employee.joining_detail.department_id, manager_id: ex.cell(line, 'B').to_i, manager_2_id: ex.cell(line, 'C').to_i)
#       else
#         puts "Not saved #{employee.manual_employee_code}"
#       end
#     end
#   end
#   puts "record inserted #{j}"
#   j = j + 1
# end

###############################################################################################
# ex = Roo::Excel.new("#{Rails.root}/public/workingdays.xls")
# ex.default_sheet = ex.sheets[7]
# j = 1
# expiry_date = '31/12/2016'.to_date
# #4.upto(366) do |line| # JANUARY DEWAS
# #370.upto(461) do |line| #JANUARY SIYA
# 2.upto(364) do |line| #FEBRUARY SIYA
#   employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
  
#   unless employee.nil?
#     puts "Starting Record---#{employee.manual_employee_code}"
#     # cl = ex.cell(line,'E').to_i
#     # el = ex.cell(line,'F').to_i

#     cl_taken = ex.cell(line,'E')
#     el_taken = ex.cell(line,'F')

#     # employee.employee_leav_balances.build(leav_category_id: 1, no_of_leave: cl, expiry_date: expiry_date, total_leave: cl)
#     # employee.employee_leav_balances.build(leav_category_id: 2, no_of_leave: el, expiry_date: expiry_date, total_leave: el)

#     cl_start_date = Date.new(2016,02,1)
#     cl_end_date = Date.new
#     cl_date_range = String.new

#     el_start_date = Date.new(2016,02,20)
#     el_end_date = Date.new
#     el_date_range = String.new

#     if cl_taken.nil?
#     else
#       cl_arr = cl_taken.divmod 1
#       cl_arr.each do |c|
#         cl_end_date = cl_start_date + c
#         cl_date_range = cl_start_date.to_s+' '+cl_start_date.to_time.to_s+' - '+cl_end_date.to_s+' '+cl_end_date.to_time.to_s 

#         if c == 0
#         else
#           if c.integer?
#             employee.employee_leav_requests.build(leav_category_id: 1, leave_type: 'Full Day', start_date: cl_start_date,end_date: cl_end_date,date_range: cl_date_range,leave_count: c, reason: 'aaa', current_status: 'Pending', is_pending: true, first_reporter_id: employee.manager_id)         
#           else
#             employee.employee_leav_requests.build(leav_category_id: 1, leave_type: 'Half Day', start_date: cl_start_date,end_date: cl_start_date, leave_count: c, reason: 'aaa', current_status: 'Pending', is_pending: true, first_reporter_id: employee.manager_id)
#           end
#         end
#       end
#     end

#     if el_taken.nil?
#     else
#       el_arr = el_taken.divmod 1
#       el_arr.each do |c|
#         el_end_date = el_start_date + c
#         el_date_range = el_start_date.to_s+' '+el_start_date.to_time.to_s+' - '+el_end_date.to_s+' '+el_end_date.to_time.to_s 

#         if c == 0

#         else
#           if c.integer?
#             puts 'Full day request.'
#             employee.employee_leav_requests.build(leav_category_id: 2, leave_type: 'Full Day', start_date: el_start_date,end_date: el_end_date,date_range: el_date_range,leave_count: c, reason: 'aaa', current_status: 'Pending', is_pending: true, first_reporter_id: employee.manager_id)
#           else
#             puts 'Half day request.'
#             employee.employee_leav_requests.build(leav_category_id: 2, leave_type: 'Half Day', start_date: el_start_date,end_date: el_start_date, leave_count: c, reason: 'aaa', current_status: 'Pending', is_pending: true, first_reporter_id: employee.manager_id)
#           end
#         end
#       end
#     end
#     employee.save  
#   end
#   puts "record inserted #{j}"
#   j = j + 1
# end

###############################################################################################
# @employee = Employee.all
# @employee.each do |e|
#   unless e.manager_id.nil?
#     if e.manager_2_id.nil?
#       @elrs = EmployeeLeavRequest.where(employee_id: e.id)
#       ActiveRecord::Base.transaction do
#         @elrs.each do |r|
#           r.is_first_approved = true
#           r.current_status = "FirstApproved"
#           #r.update(is_first_approved: true, current_status: 'FirstApproved')
#           r.leave_status_records.build(change_status_employee_id: r.first_reporter_id,status: 'FirstApproved',change_date:'01/01/2016')
#           if r.leave_type == "Full Day"
#             for i in r.start_date.to_date..r.end_date.to_date
#               r.particular_leave_records.build(employee_id: r.employee_id, leave_date: i ,is_full: true )
#             end
#           else
#             r.particular_leave_records.build(employee_id: r.employee_id, leave_date: r.start_date ,is_full: false )
#           end
#           r.save
#           r.minus_leave(r)
#           p "First Approved only for single layer employee"
#         end
#       end
#     else
#       @elrs = EmployeeLeavRequest.where(employee_id: e.id)
#       ActiveRecord::Base.transaction do
#         @elrs.each do |r|
#           r.is_first_approved = true
#           r.current_status = "FirstApproved"
#           r.second_reporter_id = e.manager_2_id
#           r.leave_status_records.build(change_status_employee_id: r.first_reporter_id,status: 'FirstApproved',change_date:'01/02/2016')
#           r.save
#           p "First Approved only for double layer employee"
#         end

#         @elrs.each do |r|
#           r.is_second_approved = true
#           r.current_status = "SecondApproved"
#           r.leave_status_records.build(change_status_employee_id: r.second_reporter_id,status: 'SecondApproved',change_date:'01/02/2016')
#           if r.leave_type == "Full Day"
#             for i in r.start_date.to_date..r.end_date.to_date
#               r.particular_leave_records.build(employee_id: r.employee_id, leave_date: i ,is_full: true )
#             end
#           else
#             r.particular_leave_records.build(employee_id: r.employee_id, leave_date: r.start_date ,is_full: false )
#           end
#           r.save
#           r.minus_leave(r)
#           p "Second Approved only for double layer employee"
#         end
#       end
#     end
#   end
# end
###########################################################################################################
# ex = Roo::Excel.new("#{Rails.root}/public/food_deduction_january_dewas.xls")
# ex.default_sheet = ex.sheets[5]
# 2.upto(372) do |line| #FEBRUARY SIYA
#   employee = Employee.find_by_manual_employee_code(ex.cell(line,'B').to_i)
#   #food_amount = ex.cell(line,'J').to_i
#   mobile_amount = ex.cell(line,'L').to_i
#   unless employee.nil?
#   	unless ex.cell(line,'L').nil?
#   		MonthlyExpence.new do |m|
#   			m.employee_id = employee.id
#   			m.expence_date = '01/01/2016'.to_date
#   			m.amount = mobile_amount
#   			m.expencess_type_id = 2
#   			m.save
#   			puts "mobile expences saved for #{employee.manual_employee_code}"
#   		end
#   	end
#   	# unless food_amount.nil?
# 	  # 	FoodDeduction.new do |f|
# 	  # 		f.food_date = '01/01/2016'.to_date
	  		
# 	  # 		no_of_coupan = food_amount / 30
# 	  # 		if no_of_coupan.integer?
# 	  # 			f.no_of_coupan =  no_of_coupan
# 	  # 			mid = 3
# 	  # 		else
# 	  # 			no_of_coupan = food_amount / 20
#   	# 			if no_of_coupan.integer?
#   	# 				f.no_of_coupan =  no_of_coupan
#   	# 				mid = 2
#   	# 	    else
#   	# 		    no_of_coupan = food_amount / 15
#   	# 		    if no_of_coupan.integer?
#   	# 		    	f.no_of_coupan =  no_of_coupan
#   	# 		    	mid = 1
#   	# 		    else
#   	# 		    	f.no_of_coupan =  0
#   	# 		    	mid = 5
#   	# 		    end
#   	# 	    end
# 	  # 		end
# 	  # 		f.amount = food_amount
	  		
# 	  # 		f.employee_id = employee.id
# 	  # 		f.food_coupan_master_id = mid
# 	  # 		f.return_coupan = 0
# 	  # 		f.total_coupan = no_of_coupan
# 	  # 		f.save
# 	  # 		puts "food deduction saved............................"
# 	  # 	end
#   	# end # food deduction nil


#   end # employee nil
# end
######################################################################################3
# @elrs = EmployeeLeavRequest.where(current_status: "Pending")
# ActiveRecord::Base.transaction do
# @elrs.each do |r|
#   unless r.employee.manager_id.nil?
#     if r.employee.manager_2_id.nil?
#       r.is_first_approved = true
#       r.current_status = "FirstApproved"
#       r.leave_status_records.build(change_status_employee_id: r.first_reporter_id,status: 'FirstApproved',change_date:'01/01/2016')
#       if r.leave_type == "Full Day"
#         for i in r.start_date.to_date..r.end_date.to_date
#           r.particular_leave_records.build(employee_id: r.employee_id, leave_date: i ,is_full: true )
#         end
#       else
#         r.particular_leave_records.build(employee_id: r.employee_id, leave_date: r.start_date ,is_full: false )
#       end
#       r.save
#       r.minus_leave(r)
#       p "First Approved only for single layer employee"
#     else
#       r.is_first_approved = true
#       r.current_status = "FirstApproved"
#       r.second_reporter_id = r.employee.manager_2_id
#       r.leave_status_records.build(change_status_employee_id: r.first_reporter_id,status: 'FirstApproved',change_date:'01/02/2016')
#       r.save
#       p "First Approved only for double layer employee"

#       r.is_second_approved = true
#       r.current_status = "SecondApproved"
#       r.leave_status_records.build(change_status_employee_id: r.second_reporter_id,status: 'SecondApproved',change_date:'01/02/2016')
#       if r.leave_type == "Full Day"
#         for i in r.start_date.to_date..r.end_date.to_date
#           r.particular_leave_records.build(employee_id: r.employee_id, leave_date: i ,is_full: true )
#         end
#       else
#         r.particular_leave_records.build(employee_id: r.employee_id, leave_date: r.start_date ,is_full: false )
#       end
#       r.save
#       r.minus_leave(r)
#       p "Second Approved only for double layer employee"
#     end
#   end
# end
#end
####################################################################

# ex = Roo::Excel.new("#{Rails.root}/public/advance_opening_balance.xls")
# ex.default_sheet = ex.sheets[5]
# j = 1
# 2.upto(30) do |line|
#   puts "Starting Record---------------------------------------"
#   @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
#   ActiveRecord::Base.transaction do |a|
#   unless @employee.nil?
#     date = ex.cell(line,'C').to_date
#     @advance_salary = AdvanceSalary.new do |a|
#       a.employee_id = @employee.id  
#       a.advance_date = date unless ex.cell(line,'C').nil?
#       a.advance_amount = ex.cell(line,'D').to_f unless ex.cell(line,'D').nil?

#       a.instalment_amount = ex.cell(line,'F').to_f unless ex.cell(line,'F').nil?
      

#       unless a.advance_amount.nil? and a.instalment_amount.nil?
#       a.no_of_instalment = (a.advance_amount.to_i / a.instalment_amount).ceil
#       end
#       a.save!
#     end

#     unless @advance_salary.nil?
#       for i in 1..@advance_salary.no_of_instalment.to_i
#         Instalment.new do |i|
#           i.advance_salary_id = @advance_salary.id
#           i.instalment_date = date
#           i.instalment_amount = @advance_salary.instalment_amount
#           i.save!
#         end
#         date = date.next_month
#       end
#     end
#   end
#   end
# end
