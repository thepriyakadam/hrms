require 'rubygems'
require 'roo'
# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
# ex.default_sheet = ex.sheets[0]
# i=1
# 2.upto(4) do |line|
# CompanyType.new do |ct|
#   ct.code = ex.cell(line,'A').to_i
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
#   dt.code = ex.cell(line,'A').to_i
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
# 2.upto(6) do |line|
# PaymentMode.new do |pm|
#   pm.code = ex.cell(line,'A').to_i
#   pm.name = ex.cell(line,'B')
#   pm.description = ex.cell(line,'C')
#   pm.save!
# end
# puts "#{i} PaymentMode inserted.-----------------------------------------------"
# i = i+1
# end

# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/target_company.xls")
# ex.default_sheet = ex.sheets[0]
# i=1
# 2.upto(37) do |line|
# TargetCompany.new do |tc|
#   tc.code = ex.cell(line,'A')
#   tc.name = ex.cell(line,'B')
#   tc.description = ex.cell(line,'C')
#   tc.save!
# end
# puts "#{i} TargetCompany inserted.-----------------------------------------------"
# i = i+1
# end

# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/resource_pool.xls")
# ex.default_sheet = ex.sheets[0]
# i=1
# 2.upto(470) do |line|
# ResourcePoolMaster.new do |tc|
#   tc.code = ex.cell(line,'A')
#   tc.name = ex.cell(line,'B')
#   tc.description = ex.cell(line,'C')
#   tc.save!
# end
# puts "#{i} ResourcePoolMaster inserted.-----------------------------------------------"
# i = i+1
# end

# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
# ex.default_sheet = ex.sheets[3]
# i=1
# 2.upto(2) do |line|
# EmployeeGrade.new do |eg|
#   eg.code = ex.cell(line,'A').to_i
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
# 2.upto(6) do |line|
# EmployeeType.new do |et|
#   et.code = ex.cell(line,'A').to_i
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
#   ec.code = ex.cell(line,'A').to_i
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
# 2.upto(13) do |line|
# Role.new do |ec|
#   ec.code = ex.cell(line,'A').to_i
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
#   ec.code = ex.cell(line,'A').to_i
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
# 2.upto(6) do |line|
# ReservedCategory.new do |ec|
#   ec.code = ex.cell(line,'A').to_i
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
# 2.upto(7) do |line|
# Religion.new do |ec|
#   ec.code = ex.cell(line,'A').to_i
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
#   ec.code = ex.cell(line,'A').to_i
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
# 2.upto(9) do |line|
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
# 2.upto(45) do |line|
# Degree.new do |ec|
#   ec.code = ex.cell(line,'A').to_i
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
#   ec.code = ex.cell(line,'A').to_i
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
# 2.upto(26) do |line|
# DegreeStream.new do |ec|
#   ec.code = ex.cell(line,'A').to_i
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
#   ec.code = ex.cell(line,'A').to_i
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
#   ec.code = ex.cell(line,'A').to_i
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
#   ec.code = ex.cell(line,'A').to_i
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
# 2.upto(25) do |line|
# SalaryComponent.new do |ec|
#   ec.code = ex.cell(line,'A').to_i
#   ec.name = ex.cell(line,'B')
#   ec.description = ex.cell(line,'C')
#   ec.account_code = ex.cell(line,'D')
#   ec.is_deducted = ex.cell(line,'E')
#   ec.is_active = ex.cell(line,'F')
#   ec.is_base = ex.cell(line,'G') 
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

# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
# ex.default_sheet = ex.sheets[23]
# i=1
# 2.upto(67) do |line|
# Year.new do |ec|
#   ec.name = ex.cell(line,'A').to_i
#   ec.save!
# end
# puts " #{i} Year inserted.-----------------------------------------------"
# i = i+1
# end

#================================== HCM MASTER END===============================# 

#================================== DEPARTMENT ==================================#

# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/department.xls")
# ex.default_sheet = ex.sheets[3]
# i=1
# 2.upto(33) do |line|
# Department.new do |ec|
#   ec.department_code = ex.cell(line,'A').to_i
#   @company_location = CompanyLocation.find_by_name(ex.cell(line,'B'))
#   ec.company_location_id =  @company_location.id unless @company_location.nil?
#   ec.name = ex.cell(line,'C')
#   @department_type = DepartmentType.find_by_name(ex.cell(line,'D'))
#   ec.department_type_id =  @department_type.id unless @department_type.nil?
#   ec.manual_department_code = ex.cell(line,'E')
#   ec.save!
# end
# puts "#{i} Departmnet inserted.-----------------------------------------------"
# i = i+1
# end

# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/department.xls")
# ex.default_sheet = ex.sheets[4]
# i=1
# 2.upto(11) do |line|
# SubDepartment.new do |ec|
#   ec.code = ex.cell(line,'A').to_i
#   @department = Department.find_by_name(ex.cell(line,'B'))
#   ec.department_id =  @department.id unless @department.nil?
#   ec.name = ex.cell(line,'C')
#   ec.save!
# end
# puts "#{i} Sub Departmnet inserted.-----------------------------------------------"
# i = i+1
# end


# ex = Roo::Excel.new("#{Rails.root}/public/Employee Wise_Service Master.xls")
# ex.default_sheet = ex.sheets[0] #siya feb
# i = 1
# ActiveRecord::Base.transaction do
# 2.upto(402) do |line| # siya Feb 2016
#  puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
#   @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
#  puts "#{i} Record inserting.----------------------------"

#  @type2 = ServiceMaster.find_by_name(ex.cell(line,'C'))
#  Employee.where(id: @employee).update_all(service_master_id: @type2.id)
#  # JoiningDetail.where(employee_pf_no: ex.cell(line,'D').to_s)
#  puts "#{i} Record inserted.-----------------------------------------------"
#  i += 1
#  end
#  end

#============================== DEPARTMENT END =====================================#
# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/SGDesignation.xls")
# ex.default_sheet = ex.sheets[1]
# i=1
# 2.upto(59) do |line|
# EmployeeDesignation.new do |ec|
#   ec.code = ex.cell(line,'A').to_i
#   ec.name = ex.cell(line,'B')
#   ec.save!
# end
# puts "#{i} State inserted.-----------------------------------------------"
# i = i+1
# end

#================================ DESIGNATION =====================================#
# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/gp.xls")
# ex.default_sheet = ex.sheets[0]
# i=1
# 2.upto(12) do |line|
# GoalPerspective.new do |ec|
#   # ec.code = ex.cell(line,'A')
#   ec.name = ex.cell(line,'B')
#   ec.save!
# end
# puts "#{i} State inserted.-----------------------------------------------"
# i = i+1
# end
#================================ EMPLOYEE BASIC DETAIL START =========================

# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/employee_span_pump.xls")
# ex.default_sheet = ex.sheets[1] 
# i=1
# 2.upto(95) do |line|
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
#   e.optinal_contact_no = ex.cell(line,'U').to_i
#   e.contact_no = ex.cell(line,'V').to_i
#   # e.optinal_contact_no1 = ex.cell(line,'W').to_i
#   e.email = ex.cell(line,'X')
#   e.optional_email = ex.cell(line,'Y')
#   e.handicap = ex.cell(line,'Z')
#   e.handicap_type = ex.cell(line, 'AA')
  
#   @employee_type = EmployeeType.find_by_name(ex.cell(line,'AB'))
#   e.employee_type_id = @employee_type.id unless @employee_type.nil?

#   e.status = ex.cell(line,'AC')
  
#   # e.company_id = ex.cell(line,'AA').to_i
#   @company_name = Company.find_by_name(ex.cell(line,'AD'))
#   e.company_id = @company_name.id unless @company_name.nil?
#   @company_location_name = CompanyLocation.find_by_name(ex.cell(line,'AE'))
#   e.company_location_id = @company_location_name.id unless @company_location_name.nil?
#   @department_name = Department.find_by_name(ex.cell(line,'AF'))
#   e.department_id =  @department_name.id unless @department_name.nil?
#   @sub_department_name = SubDepartment.find_by_name(ex.cell(line,'AG'))
#   e.sub_department_id =  @sub_department_name.id unless @sub_department_name.nil?

#   @code_master = EmployeeCodeMaster.find_by_name(ex.cell(line,'AH'))
#   e.employee_code_master_id = @code_master.id unless @code_master.nil?

#   e.save!
# end
# puts "#{i} Employee inserted.-----------------------------------------------"
# i = i+1
# end


# # #========================= EMPLOYEE BASIC DATA END ===========================================

# # #========================= EMPLOYEE ON BOARDING DATA START ===================================

# ex = Roo::Excel.new("#{Rails.root}/public/sg_bank.xls")
# ex.default_sheet = ex.sheets[2] #siya feb
# i = 1
# ActiveRecord::Base.transaction do
# 2.upto(36) do |line| # siya Feb 2016
#  puts "Starting Record --------------------------#{ex.cell(line,'A')}"
#  @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
#  # JoiningDetail.where(id: @employee.id).update_all(is_da: true)
#  unless @employee.nil?

#  @joining_details = JoiningDetail.where(employee_id: @employee.id)
#   @joining_details.new do |e|
#      e.employee_uan_no = ex.cell(line,'C').to_i
#      e.joining_date =  ex.cell(line,'D')
#      e.confirmation_date =  ex.cell(line,'E')
#      @designation = EmployeeDesignation.find_by_name(ex.cell(line,'F'))
#      e.employee_designation_id = @designation.id unless @designation.nil?
#       @grade = EmployeeGrade.find_by_name(ex.cell(line,'G'))
#      e.employee_grade_id = @grade.id unless @grade.nil?
#       @cost_unit = CostCenter.find_by_name(ex.cell(line,'H'))
#      e.cost_center_id = @cost_unit.id unless @cost_unit.nil?
#      # e.employee_pf_no = ex.cell(line,'F').to_i
#      @category = EmployeeCategory.find_by_name(ex.cell(line,'I'))
#      e.employee_category_id = @category.id unless @category.nil?

#      # e.probation_period = ex.cell(line,'H').to_i
#      e.probation_period = ex.cell(line,'K').to_i
#      e.notice_period =     ex.cell(line,'L').to_i
#      e.notice_period_after_probation =     ex.cell(line,'M').to_i

#      e.have_passport = ex.cell(line,'N')
#      e.passport_no = ex.cell(line,'O').to_i
#      e.passport_issue_date = ex.cell(line,'P')
#      e.passport_expiry_date = ex.cell(line,'Q')
#      e.retirement_date = ex.cell(line,'R')
#      e.company_rfid = ex.cell(line,'S').to_i
#      e.gate_rfid = ex.cell(line,'T').to_i
#     e.save!

#     puts "Save...."
#    end
#    puts "#{i} Record inserted.------#{ex.cell(line,'B')}--------#{ex.cell(line,'C')}---------#{ex.cell(line,'D')}.....#{ex.cell(line,'E')}......#{ex.cell(line,'G')}"
#    i += 1
#  end
#  end
# end

#==================================== EMPLOYEE ON BOARDING DATA END ====================================================#

# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/sg_bank.xls")
# ex.default_sheet = ex.sheets[0] 
# i=1
# 2.upto(358) do |line|
# @employee = Employee.find_by_manual_employee_code(ex.cell(line,'B').to_i)
# EmployeeBankDetail.new do |b|
#   b.employee_id = @employee.id unless @employee.nil?
#   b.account_no = ex.cell(line,'D').to_i
#   b.bank_name = ex.cell(line,'E')
#   b.branch_name = ex.cell(line,'F')
#   b.address = ex.cell(line,'K')
#   b.contact_no = ex.cell(line,'G').to_i
#   b.micr_code = ex.cell(line,'H')
#   b.branch_code = ex.cell(line,'I')
#   b.ifsc_code = ex.cell(line,'J')
#   @bankname = Bank.find_by_name(ex.cell(line,'E'))
#   b.bank_id = @bankname.id unless @bankname.nil?

#   b.save!
# end
# puts "#{i} Record inserted.-----------------------------------------------"
# i = i+1
# end

# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/sg_cer.xls")
# ex.default_sheet = ex.sheets[0] 
# i=1
# 2.upto(38) do |line|
# @employee = Employee.find_by_manual_employee_code(ex.cell(line,'B').to_i)
# Certification.new do |b|
#   b.employee_id = @employee.id unless @employee.nil?
#   b.name = ex.cell(line,'D')
#   @year = Year.find_by_name(ex.cell(line,'E'))
#   b.year_id = @year.id unless @year.nil?
#   b.duration = ex.cell(line,'F')
#   b.description = ex.cell(line,'G')
#   b.save!
# end
# puts "#{i} Record inserted.-----------------------------------------------"
# i = i+1
# end


# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/sg_award.xls")
# ex.default_sheet = ex.sheets[0] 
# i=1
# 2.upto(19) do |line|
# @employee = Employee.find_by_manual_employee_code(ex.cell(line,'B').to_i)
# Award.new do |b|
#   b.employee_id = @employee.id unless @employee.nil?
#   b.award_name = ex.cell(line,'D')
#   @year = Year.find_by_name(ex.cell(line,'E'))
#   b.year_id = @year.id unless @year.nil?
#   b.award_from = ex.cell(line,'F')
#   b.description = ex.cell(line,'G')
#   b.save!
# end
# puts "#{i} Record inserted.-----------------------------------------------"
# i = i+1
# end

# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/sg_qualification.xls")
# ex.default_sheet = ex.sheets[0] 
# i=1
# 2.upto(38) do |line|
# @employee = Employee.find_by_manual_employee_code(ex.cell(line,'B').to_i)
# Qualification.new do |b|
#   b.employee_id = @employee.id unless @employee.nil?
#   @degree_type = DegreeType.find_by_name(ex.cell(line,'D'))
#   b.degree_type_id = @degree_type.id unless @degree_type.nil?
#   @degree = Degree.find_by_name(ex.cell(line,'E'))
#   b.degree_id = @degree.id unless @degree.nil?
#   @degree_stream = DegreeStream.find_by_name(ex.cell(line,'F'))
#   b.degree_stream_id = @degree_stream.id unless @degree_stream.nil?
#   @university = University.find_by_name(ex.cell(line,'J'))
#   b.university_id = @university.id unless @university.nil?
#   @year = Year.find_by_name(ex.cell(line,'H'))
#   b.year_id = @year.id unless @year.nil?
#   b.college = ex.cell(line,'I')
#   b.marks = ex.cell(line,'G')
#   b.save!
# end
# puts "#{i} Record inserted.-----------------------------------------------"
# i = i+1
# end


# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/sglb.xls")
# ex.default_sheet = ex.sheets[0] 
# i=1

# 2.upto(460) do |line|
# @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
# puts "#{(ex.cell(line,'A'))} Record inserted. #{@employee.id}-----------------------------------------------"
# EmployeeLeavBalance.new do |j|

#   j.employee_id = @employee.id unless @employee.nil?
#   puts "#{(ex.cell(line,'A'))} Record inserted........Employee ID #{@employee.id}-----------------------------------------------"
#   j.leav_category_id = ex.cell(line,'C').to_i
#   puts "#{(ex.cell(line,'C'))} Record inserted.-----------------------------------------------"
#   j.no_of_leave = ex.cell(line,'D').to_f
#   # j.expiry_date = ex.cell(line,'E')
#   j.total_leave = ex.cell(line,'E').to_f
#   j.from_date = ex.cell(line,'F')
#   j.to_date = ex.cell(line,'G')

#   j.save!
# end
# puts "#{i} Record inserted.-----------------------------------------------"
# i = i+1
# end

# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/sp_leave_bal.xls")
# ex.default_sheet = ex.sheets[1] 
# i=1

# 2.upto(51) do |line|
# @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
# puts "#{(ex.cell(line,'A'))} Record inserted. #{@employee.id}-----------------------------------------------"
# EmployeeLeavBalance.new do |j|
# 2.upto(51) do |line|
# @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
# puts "#{(ex.cell(line,'A'))} Record inserted. #{@employee.id}-----------------------------------------------"
# EmployeeLeavBalance.new do |j|

#   j.employee_id = @employee.id unless @employee.nil?
#   puts "#{(ex.cell(line,'A'))} Record inserted........Employee ID #{@employee.id}-----------------------------------------------"
#   j.leav_category_id = ex.cell(line,'C').to_i
#   puts "#{(ex.cell(line,'C'))} Record inserted.-----------------------------------------------"
#   j.no_of_leave = ex.cell(line,'D')
#   j.expiry_date = ex.cell(line,'E')
#   j.total_leave = ex.cell(line,'F')
#   j.from_date = ex.cell(line,'G')
#   j.to_date = ex.cell(line,'H')
#   j.save!
# end
# puts "#{i} Record inserted.-----------------------------------------------"
# i = i+1
# end

# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/sp_leave_bal.xls")
# ex.default_sheet = ex.sheets[1] 
# i=1

# 2.upto(51) do |line|
# @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
# puts "#{(ex.cell(line,'A'))} Record inserted. #{@employee.id}-----------------------------------------------"
# EmployeeLeavBalance.new do |j|
#   j.employee_id = @employee.id unless @employee.nil?
#   puts "#{(ex.cell(line,'A'))} Record inserted........Employee ID #{@employee.id}-----------------------------------------------"
#   j.leav_category_id = ex.cell(line,'C').to_i
#   puts "#{(ex.cell(line,'C'))} Record inserted.-----------------------------------------------"
#   j.no_of_leave = ex.cell(line,'D')
#   j.expiry_date = ex.cell(line,'E')
#   j.total_leave = ex.cell(line,'F')
#   j.from_date = ex.cell(line,'G')
#   j.to_date = ex.cell(line,'H')
#   j.save!
# end
# puts "#{i} Record inserted.-----------------------------------------------"
# i = i+1
# end

# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/spelb.xls")
# ex.default_sheet = ex.sheets[1] 
# i=1

# 2.upto(173) do |line|
# @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A'))
# puts "#{(ex.cell(line,'A'))} Record inserted. #{@employee.id}-----------------------------------------------"
# EmployeeLeavBalance.new do |j|

#   j.employee_id = @employee.id unless @employee.nil?
#   puts "#{(ex.cell(line,'A'))} Record inserted........Employee ID #{@employee.id}-----------------------------------------------"
#   j.leav_category_id = ex.cell(line,'C').to_i
#   puts "#{(ex.cell(line,'C'))} Record inserted.-----------------------------------------------"
#   j.no_of_leave = ex.cell(line,'D')
#   j.expiry_date = ex.cell(line,'E')
#   j.total_leave = ex.cell(line,'F')
#   j.from_date = ex.cell(line,'G')
#   j.to_date = ex.cell(line,'H')
#   j.save!
# end
# puts "#{i} Record inserted.-----------------------------------------------"
# i = i+1
# end

# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/spelb.xls")
# ex.default_sheet = ex.sheets[2] 
# i=1
# 15.upto(31) do |line|
# @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A'))
# puts "#{(ex.cell(line,'A'))} Record inserted. #{@employee.id}-----------------------------------------------"
# EmployeeLeavBalance.new do |j|

#   j.employee_id = @employee.id unless @employee.nil?
#   puts "#{(ex.cell(line,'A'))} Record inserted........Employee ID #{@employee.id}-----------------------------------------------"
#   j.leav_category_id = ex.cell(line,'C').to_i
#   puts "#{(ex.cell(line,'C'))} Record inserted.-----------------------------------------------"
#   j.no_of_leave = ex.cell(line,'D')
#   j.expiry_date = ex.cell(line,'E')
#   j.total_leave = ex.cell(line,'F')
#   j.from_date = ex.cell(line,'G')
#   j.to_date = ex.cell(line,'H')
#   j.save!
# end
# puts "#{i} Record inserted.-----------------------------------------------"
# i = i+1
# end



#==================================== EMPLOYEE BANK DETAILS DATA START ==================================================#


#==================================== EMPLOYEE BANK DETAILS DATA END  ===================================================#
# ex = Roo::Excel.new("#{Rails.root}/public/sp_onbording.xls")
# ex.default_sheet = ex.sheets[0] #siya feb
# i = 1
# ActiveRecord::Base.transaction do
# 2.upto(83) do |line| # siya Feb 2016
#  puts "Starting Record #{ex.cell(line,'B')}---------------------------------------"
#   @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
#  puts "#{i} Record inserting.----------------------------"


#   @type2 = EmployeeDesignation.find_by_name(ex.cell(line,'F'))
#  JoiningDetail.where(employee_id: @employee).update_all(employee_designation_id: @type2)
#  # JoiningDetail.where(employee_pf_no: ex.cell(line,'D').to_s)
#  puts "#{i} Record inserted.-----------------------------------------------"
#  i += 1
#  end
#  end

# ===========================



# ex = Roo::Excel.new("#{Rails.root}/public/spep.xls")
# ex.default_sheet = ex.sheets[0]
# j = 1
# gross_salary = 0
# ActiveRecord::Base.transaction do
# 2.upto(168) do |line|
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

#       # elsif t.salary_component.name == "Other Allowance"
#       # est.monthly_amount = ex.cell(line,'E') unless ex.cell(line,'E').nil?
#       # est.annual_amount = est.monthly_amount.to_i * 12
#       # gross_salary = gross_salary + ex.cell(line,'E').to_i

#       # puts "Convenience Allowance..................Salary"

#       elsif t.salary_component.name == "Medical Reimbursement"
#       est.monthly_amount = ex.cell(line,'F') unless ex.cell(line,'F').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'F').to_i

#       puts "Medical Reimbursement..................Salary"

#   elsif t.salary_component.name == "Leave Travel Allowance"
#       est.monthly_amount = ex.cell(line,'G') unless ex.cell(line,'G').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'G').to_i

#       puts "Leave Travel Allowance..................Salary"

#   elsif t.salary_component.name == "Children Education Allowance"
#       est.monthly_amount = ex.cell(line,'H') unless ex.cell(line,'H').nil?
#       est.annual_amount = est.monthly_amount.to_i * 12
#       gross_salary = gross_salary + ex.cell(line,'H').to_i

#       puts "Children Education Allowance..................Salary"



# #  elsif t.salary_component.name == "Progressive Allowance"
# #       est.monthly_amount = ex.cell(line,'I') unless ex.cell(line,'I').nil?
# #       est.annual_amount = est.monthly_amount.to_i * 12
# #       gross_salary = gross_salary + ex.cell(line,'I').to_i

#       puts "Program Allowance..................Salary"
# #  # elsif t.salary_component.name == "Transport Allowance"
# #  #      est.monthly_amount = ex.cell(line,'J') unless ex.cell(line,'J').nil?
# #  #      est.annual_amount = est.monthly_amount.to_i * 12
# #  #      gross_salary = gross_salary + ex.cell(line,'J').to_i

# #  #      puts "Transport Allowance..................Salary"

      
#     end
#       est.save!
#       puts "#{j} component inserted..."
#       j=j+1
#     end
#   end
#   gross_salary = 0
# end
# end


# ex = Roo::Excel.new("#{Rails.root}/public/sp_food.xls")
#  ex.default_sheet = ex.sheets[0] #siya feb
#  i = 1
#  ActiveRecord::Base.transaction do

#  2.upto(14) do |line| # siya Feb 201
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
# ex = Roo::Excel.new("#{Rails.root}/public/skillset.xls")
# ex.default_sheet = ex.sheets[0]
# i=1
# 2.upto(133) do |line|
# InterviewAttribute.new do |ia|
#   ia.code = ex.cell(line,'A')
#   ia.name = ex.cell(line,'B')
#   ia.description = ex.cell(line,'C')
#   ia.save!
# end
# puts "#{i} Interview Attribute inserted.-----------------------------------------------"
# i = i+1
# end

#  ex = Roo::Excel.new("#{Rails.root}/public/sp_working_day.xls")
#  ex.default_sheet = ex.sheets[0] #siya feb
#  i = 1
#  ActiveRecord::Base.transaction do
#  2.upto(12) do |line| # siya Feb 201
#    puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
#    @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
#    unless @employee.nil?
#      Workingday.new do |w|
#        w.employee_id = @employee.id
#        w.month_name = ex.cell(line, 'B')
#        w.year = ex.cell(line, 'C').to_i
#        w.day_in_month = ex.cell(line, 'D')
#        w.week_off_day = ex.cell(line, 'E').to_i
#        w.holiday_in_month = ex.cell(line, 'F')
#        w.pay_leave = ex.cell(line, 'G').to_i
#        w.nonpay_leave = ex.cell(line, 'K')
#        w.payable_day = ex.cell(line, 'L')
#          w.date = ex.cell(line, 'M')
#        w.save!
#      end
#      puts "#{i} Record inserted.-----------------------------------------------"
#      i += 1
#    end
#    end
# end
# InterviewEvalution.destroy_all
# InterviewDecision.destroy_all
# InterviewAttribute.destroy_all
# SelectedResume.destroy_all
# InterviewRound.destroy_all
# InterviewType.destroy_all
# InterviewAnalysis.destroy_all
# InterviewRoundSchedule.destroy_all
# InterviewSchedule.destroy_all
# ParticularVacancyRequest.destroy_all
# ReportingMastersVacancyMaster.destroy_all

# VacancyMaster.destroy_all

ex = Roo::Excel.new("#{Rails.root}/public/Book1.xls")
 ex.default_sheet = ex.sheets[0] #siya feb
 i = 1
 ActiveRecord::Base.transaction do

 2.upto(102) do |line| # siya Feb 201
   puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
   @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
   unless @employee.nil?

     FoodDeduction.new do |w|
       w.employee_id = @employee.id
       w.no_of_coupan = ex.cell(line, 'B')
       w.return_coupan = ex.cell(line, 'C').to_i
       w.total_coupan = ex.cell(line, 'D')
       w.food_coupan_master_id = ex.cell(line, 'E').to_i
       w.amount = ex.cell(line, 'F')
       w.food_date = ex.cell(line, 'G')
       w.save!
       puts "#{i} Record inserted.---------Food--------------------------------------"
     end
     i += 1
   end
   end
 end

#  ex = Roo::Excel.new("#{Rails.root}/public/employee_attendance.xls")
#  ex.default_sheet = ex.sheets[0] #siya feb
#  i = 1
#  ActiveRecord::Base.transaction do
#  2.upto(196) do |line| # siya Feb 201
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
#      puts "#{i} Record inserted.---------------Attendance--------------------------------"
#      i += 1
#    end
#    end
# end