require 'rubygems'
require 'roo'
puts "Starting ..."
ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
ex.default_sheet = ex.sheets[0]
i=1
2.upto(4) do |line|
CompanyType.new do |ct|
  ct.code = ex.cell(line,'A')
  ct.name = ex.cell(line,'B')
  ct.description = ex.cell(line,'C')
  ct.save!
end
puts "#{i} Company Type inserted.-----------------------------------------------"
i = i+1
end

puts "Starting ..."
ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
ex.default_sheet = ex.sheets[1]
i=1
2.upto(4) do |line|
DepartmentType.new do |dt|
  dt.code = ex.cell(line,'A')
  dt.name = ex.cell(line,'B')
  dt.description = ex.cell(line,'C')
  dt.save!
end
puts "#{i} Departmnet Type inserted.-----------------------------------------------"
i = i+1
end


puts "Starting ..."
ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
ex.default_sheet = ex.sheets[2]
i=1
2.upto(6) do |line|
PaymentMode.new do |pm|
  pm.code = ex.cell(line,'A')
  pm.name = ex.cell(line,'B')
  pm.description = ex.cell(line,'C')
  pm.save!
end
puts "#{i} PaymentMode inserted.-----------------------------------------------"
i = i+1
end

puts "Starting ..."
ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
ex.default_sheet = ex.sheets[3]
i=1
2.upto(2) do |line|
EmployeeGrade.new do |eg|
  eg.code = ex.cell(line,'A')
  eg.name = ex.cell(line,'B')
  eg.description = ex.cell(line,'C')
  eg.save!
end
puts "#{i} EmployeeGrade inserted.-----------------------------------------------"
i = i+1
end


puts "Starting ..."
ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
ex.default_sheet = ex.sheets[4]
i=1
2.upto(6) do |line|
EmployeeType.new do |et|
  et.code = ex.cell(line,'A')
  et.name = ex.cell(line,'B')
  et.description = ex.cell(line,'C')
  et.save!
end
puts "#{i} EmployeeType inserted.-----------------------------------------------"
i = i+1
end


puts "Starting ..."
ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
ex.default_sheet = ex.sheets[5]
i=1
2.upto(4) do |line|
EmployeeCategory.new do |ec|
  ec.code = ex.cell(line,'A')
  ec.name = ex.cell(line,'B')
  ec.description = ex.cell(line,'C')
  ec.save!
end
puts "#{i} EmployeeCategory inserted.-----------------------------------------------"
i = i+1
end

puts "Starting ..."
ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
ex.default_sheet = ex.sheets[6]
i=1
2.upto(6) do |line|
Role.new do |ec|
  ec.code = ex.cell(line,'A')
  ec.name = ex.cell(line,'B')
  ec.description = ex.cell(line,'C')
  ec.save!
end
puts "#{i} Role inserted.-----------------------------------------------"
i = i+1
end

puts "Starting ..."
ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
ex.default_sheet = ex.sheets[7]
i=1
2.upto(2) do |line|
Nationality.new do |ec|
  ec.code = ex.cell(line,'A')
  ec.name = ex.cell(line,'B')
  ec.description = ex.cell(line,'C')
  ec.save!
end
puts "#{i} Nationality inserted.-----------------------------------------------"
i = i+1
end

puts "Starting ..."
ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
ex.default_sheet = ex.sheets[8]
i=1
2.upto(6) do |line|
ReservedCategory.new do |ec|
  ec.code = ex.cell(line,'A')
  ec.name = ex.cell(line,'B')
  ec.description = ex.cell(line,'C')
  ec.save!
end
puts "#{i} Reserved Category inserted.-----------------------------------------------"
i = i+1
end

puts "Starting ..."
ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
ex.default_sheet = ex.sheets[9]
i=1
2.upto(7) do |line|
Religion.new do |ec|
  ec.code = ex.cell(line,'A')
  ec.name = ex.cell(line,'B')
  ec.description = ex.cell(line,'C')
  ec.save!
end
puts "#{i} Religion inserted.-----------------------------------------------"
i = i+1
end

puts "Starting ..."
ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
ex.default_sheet = ex.sheets[10]
i=1
2.upto(9) do |line|
RelationMaster.new do |ec|
  ec.code = ex.cell(line,'A')
  ec.name = ex.cell(line,'B')
  ec.description = ex.cell(line,'C')
  ec.save!
end
puts "#{i} Relation inserted.-----------------------------------------------"
i = i+1
end

puts "Starting ..."
ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
ex.default_sheet = ex.sheets[11]
i=1
2.upto(9) do |line|
BloodGroup.new do |ec|
  ec.name = ex.cell(line,'B')
  ec.save!
end
puts "#{i} BloodGroup inserted.-----------------------------------------------"
i = i+1
end


puts "Starting ..."
ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
ex.default_sheet = ex.sheets[12]
i=1
2.upto(45) do |line|
Degree.new do |ec|
  ec.code = ex.cell(line,'A')
  ec.name = ex.cell(line,'B')
  ec.description = ex.cell(line,'C')
  ec.save!
end
puts "#{i} Dgree inserted.-----------------------------------------------"
i = i+1
end


puts "Starting ..."
ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
ex.default_sheet = ex.sheets[13]
i=1
2.upto(11) do |line|
DegreeType.new do |ec|
  ec.code = ex.cell(line,'A')
  ec.name = ex.cell(line,'B')
  ec.description = ex.cell(line,'C')
  ec.save!
end
puts "#{i} DgreeType inserted.-----------------------------------------------"
i = i+1
end

puts "Starting ..."
ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
ex.default_sheet = ex.sheets[14]
i=1
2.upto(26) do |line|
DegreeStream.new do |ec|
  ec.code = ex.cell(line,'A')
  ec.name = ex.cell(line,'B')
  ec.description = ex.cell(line,'C')
  ec.save!
end
puts "#{i} DgreeStream inserted.-----------------------------------------------"
i = i+1
end


puts "Starting ..."
ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
ex.default_sheet = ex.sheets[15]
i=1
2.upto(5) do |line|
TravelExpenceType.new do |ec|
  ec.code = ex.cell(line,'A')
  ec.name = ex.cell(line,'B')
  ec.description = ex.cell(line,'C')
  ec.save!
end
puts "#{i} TravelExpenceType inserted.-----------------------------------------------"
i = i+1
end


puts "Starting ..."
ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
ex.default_sheet = ex.sheets[16]
i=1
2.upto(5) do |line|
TravelMode.new do |ec|
  ec.code = ex.cell(line,'A')
  ec.name = ex.cell(line,'B')
  ec.description = ex.cell(line,'C')
  ec.save!
end
puts "#{i} TravelMode inserted.-----------------------------------------------"
i = i+1
end

puts "Starting ..."
ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
ex.default_sheet = ex.sheets[17]
i=1
2.upto(4) do |line|
TravelOption.new do |ec|
  ec.code = ex.cell(line,'A')
  ec.name = ex.cell(line,'B')
  ec.discription = ex.cell(line,'C')
  ec.save!
end
puts "#{i} TravelOption inserted.-----------------------------------------------"
i = i+1
end

puts "Starting ..."
ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
ex.default_sheet = ex.sheets[18]
i=1
2.upto(7) do |line|
LeavCategory.new do |ec|
  ec.code = ex.cell(line,'A')
  ec.name = ex.cell(line,'B')
  ec.description = ex.cell(line,'C')
  ec.is_payble = ex.cell(line,'D')
  ec.save!
end
puts "#{i} LeaveCategory inserted.-----------------------------------------------"
i = i+1
end


puts "Starting ..."
ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
ex.default_sheet = ex.sheets[19]
i=1
2.upto(22) do |line|
SalaryComponent.new do |ec|
  ec.code = ex.cell(line,'A')
  ec.name = ex.cell(line,'B')
  ec.description = ex.cell(line,'C')
  ec.account_code = ex.cell(line,'D')
  ec.is_deducted = ex.cell(line,'E')
  ec.save!
end
puts "#{i} SalaryComponent inserted.-----------------------------------------------"
i = i+1
end

puts "Starting ..."
ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
ex.default_sheet = ex.sheets[20]
i=1
2.upto(2) do |line|
Country.new do |ec|
  ec.code = ex.cell(line,'A')
  ec.name = ex.cell(line,'B')
  ec.save!
end
puts "#{i} Country inserted.-----------------------------------------------"
i = i+1
end

puts "Starting ..."
ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
ex.default_sheet = ex.sheets[21]
i=1
2.upto(37) do |line|
State.new do |ec|
  ec.country_id = ex.cell(line,'A')
  ec.code = ex.cell(line,'B')
  ec.name = ex.cell(line,'C')
  ec.save!
end
puts "#{i} State inserted.-----------------------------------------------"
i = i+1
end


puts "Starting ..."
ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
ex.default_sheet = ex.sheets[22]
i=1
2.upto(1033) do |line|
District.new do |ec|
  ec.state_id = ex.cell(line,'A')
  ec.code = ex.cell(line,'B')
  ec.name = ex.cell(line,'C')
  ec.save!
end
puts " #{i} District inserted.-----------------------------------------------"
i = i+1
end

#================================== HCM MASTER END===============================# 

#================================== DEPARTMENT ==================================#

# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/department.xls")
# ex.default_sheet = ex.sheets[1]
# i=1
# 2.upto(166) do |line|
# Department.new do |ec|
#   ec.department_code = ex.cell(line,'A')
#   ec.company_location_id = ex.cell(line,'B').to_i
#   ec.name = ex.cell(line,'C')
#   ec.department_type_id = ex.cell(line,'D').to_i
#   ec.manual_department_code = ex.cell(line,'E')
#   ec.save!
# end
# puts "#{i} State inserted.-----------------------------------------------"
# i = i+1
# end


# ex = Roo::Excel.new("#{Rails.root}/public/update_dep.xls")
# ex.default_sheet = ex.sheets[0] #siya feb
# i = 1
# ActiveRecord::Base.transaction do
# 2.upto(424) do |line| # siya Feb 2016
#  puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
#   @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
#  puts "#{i} Record inserting.----------------------------"


#   @type2 = Department.find_by_name(ex.cell(line,'B'))
#  Employee.where(id: @employee).update_all(department_id: @type2.id)
#  # JoiningDetail.where(employee_pf_no: ex.cell(line,'D').to_s)
#  puts "#{i} Record inserted.-----------------------------------------------"
#  i += 1
#  end
#  end

#============================== DEPARTMENT END =====================================#
# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/SGDesignation.xls")
# ex.default_sheet = ex.sheets[0]
# i=1
# 2.upto(111) do |line|
# EmployeeDesignation.new do |ec|
#   ec.code = ex.cell(line,'A')
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
# ex = Roo::Excel.new("#{Rails.root}/public/mdindia.xls")
# ex.default_sheet = ex.sheets[0] 
# i=1

# 2.upto(9497) do |line|
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
#   e.contact_no = ex.cell(line,'U').to_i
#   e.email = ex.cell(line,'V')
#   e.handicap = ex.cell(line,'W')
#   e.handicap_type = ex.cell(line, 'X')
  
#   @type = EmployeeType.find_by_name(ex.cell(line,'Y'))
#   e.employee_type_id = @type.id unless @type.nil?

#   e.status = ex.cell(line,'Z')
  
#   # e.company_id = ex.cell(line,'AA').to_i
#   @type1 = Company.find_by_name(ex.cell(line,'AA'))
#   e.company_id = @type1.id unless @type1.nil?
#   @type1 = CompanyLocation.find_by_name(ex.cell(line,'AB'))
#   e.company_location_id = @type1.id unless @type1.nil?
#   @type2 = Department.find_by_name(ex.cell(line,'AC'))
#   e.department_id =  @type2.id unless @type2.nil?

#   @code_master = EmployeeCodeMaster.find_by_name(ex.cell(line,'AD'))
#   e.employee_code_master_id = @code_master.id unless @code_master.nil?

#   e.save!
# end
# puts "#{i} Employee inserted.-----------------------------------------------"
# i = i+1
# end


#========================= EMPLOYEE BASIC DATA END ===========================================

#========================= EMPLOYEE ON BOARDING DATA START ===================================

# ex = Roo::Excel.new("#{Rails.root}/public/j.xls")
# ex.default_sheet = ex.sheets[0] #siya feb
# i = 1
# ActiveRecord::Base.transaction do
# 2.upto(424) do |line| # siya Feb 2016
#  puts "Starting Record --------------------------#{ex.cell(line,'A')}"
#  @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
#  # JoiningDetail.where(id: @employee.id).update_all(is_da: true)
#  unless @employee.nil?

#  @joining_details = JoiningDetail.where(employee_id: @employee.id)
#   @joining_details.new do |e|
#      e.employee_uan_no = ex.cell(line,'B').to_i
#      e.joining_date =  ex.cell(line,'C')
#      e.confirmation_date =  ex.cell(line,'D')
#      @designation = EmployeeDesignation.find_by_name(ex.cell(line,'E'))
#      e.employee_designation_id = @designation.id unless @designation.nil?
#       @grade = EmployeeGrade.find_by_name(ex.cell(line,'F'))
#      e.employee_grade_id = @grade.id unless @grade.nil?
#      # e.employee_pf_no = ex.cell(line,'F').to_i
#      @category = EmployeeCategory.find_by_name(ex.cell(line,'G'))
#      e.employee_category_id = @category.id unless @category.nil?

#      e.probation_period = ex.cell(line,'H').to_i
#      e.probation_period = ex.cell(line,'I').to_i
#      e.notice_period =     ex.cell(line,'J').to_i

#      e.have_passport = ex.cell(line,'K')
#      e.passport_no = ex.cell(line,'L').to_i
#      e.passport_issue_date = ex.cell(line,'M')
#      e.passport_expiry_date = ex.cell(line,'N')
#      e.retirement_date = ex.cell(line,'O')
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
# ex = Roo::Excel.new("#{Rails.root}/public/eb.xls")
# ex.default_sheet = ex.sheets[0] 
# i=1
# 3.upto(412) do |line|
# @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
# EmployeeBankDetail.new do |b|
#   b.employee_id = @employee.id unless @employee.nil?
#   b.account_no = ex.cell(line,'C').to_i
#   b.bank_name = ex.cell(line,'D')
#   b.branch_name = ex.cell(line,'E')
#   b.address = ex.cell(line,'J')
#   b.contact_no = ex.cell(line,'F').to_i
#   b.micr_code = ex.cell(line,'G')
#   b.branch_code = ex.cell(line,'H')
#   b.ifsc_code = ex.cell(line,'I')
#   b.save!
# end
# puts "#{i} Record inserted.-----------------------------------------------"
# i = i+1
# end


# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/el.xls")
# ex.default_sheet = ex.sheets[0] 
# i=1

# 2.upto(385) do |line|
# @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
# EmployeeLeavBalance.new do |j|
#   j.employee_id = @employee.id unless @employee.nil?
#   j.leav_category_id = ex.cell(line,'C')
#   j.no_of_leave = ex.cell(line,'D')
#   j.expiry_date = ex.cell(line,'E')
#   j.total_leave = ex.cell(line,'F')
#   j.expiry_date = ex.cell(line,'G')
#   j.total_leave = ex.cell(line,'H')
#   j.save!
# end
# puts "#{i} Record inserted.-----------------------------------------------"
# i = i+1
# end



#==================================== EMPLOYEE BANK DETAILS DATA START ==================================================#


#==================================== EMPLOYEE BANK DETAILS DATA END  ===================================================#
# ex = Roo::Excel.new("#{Rails.root}/public/joining_detail_report.xls")
# ex.default_sheet = ex.sheets[1] #siya feb
# i = 1
# ActiveRecord::Base.transaction do
# 2.upto(169) do |line| # siya Feb 2016
#  puts "Starting Record #{ex.cell(line,'B')}---------------------------------------"
#   @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A'))
#  puts "#{i} Record inserting.----------------------------"


#   @type2 = Department.find_by_name(ex.cell(line,'B'))
#  Employee.where(id: @employee).update_all(department_id: @type2)
#  # JoiningDetail.where(employee_pf_no: ex.cell(line,'D').to_s)
#  puts "#{i} Record inserted.-----------------------------------------------"
#  i += 1
#  end
#  end