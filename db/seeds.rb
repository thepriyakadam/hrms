require 'rubygems'
require 'roo'

ex = Roo::Excel.new("#{Rails.root}/public/a.xls")

ex.default_sheet = ex.sheets[4] #siya feb
i = 1
ActiveRecord::Base.transaction do

2.upto(5) do |line| # siya Feb 2016
  puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
  @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
  unless @employee.nil?

    Workingday.new do |w|
      w.employee_id = @employee.id
      w.month_name = ex.cell(line, 'B')
      w.year = ex.cell(line, 'C').to_i

      w.day_in_month = ex.cell(line, 'D')
      w.present_day = ex.cell(line, 'E')
      w.week_off_day = ex.cell(line, 'F')

      w.cl_leave = ex.cell(line, 'G').to_i
      w.el_leave = ex.cell(line, 'H').to_i
      w.coff_leave = ex.cell(line, 'I').to_i

     
      w.holiday_in_month = ex.cell(line, 'J')

     
      w.absent_day = ex.cell(line, 'K')
      w.payable_day = ex.cell(line, 'L')
      w.save!
    end
    puts "#{i} Record inserted.-----------------------------------------------"
    i += 1
  end
  end
end

# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
# ex.default_sheet = ex.sheets[0]
# i=1
# 2.upto(3) do |line|
# CompanyType.new do |ct|
#   ct.code = ex.cell(line,'A')
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
#   dt.code = ex.cell(line,'A')
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
# 2.upto(3) do |line|
# PaymentMode.new do |pm|
#   pm.code = ex.cell(line,'A')
#   pm.name = ex.cell(line,'B')
#   pm.description = ex.cell(line,'C')
#   pm.save!
# end
# puts "#{i} PaymentMode inserted.-----------------------------------------------"
# i = i+1
# end

# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/hrms.xls")
# ex.default_sheet = ex.sheets[3]
# i=1
# 2.upto(2) do |line|
# EmployeeGrade.new do |eg|
#   eg.code = ex.cell(line,'A')
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
# 2.upto(5) do |line|
# EmployeeType.new do |et|
#   et.code = ex.cell(line,'A')
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
#   ec.code = ex.cell(line,'A')
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
# 2.upto(8) do |line|
# Role.new do |ec|
#   ec.code = ex.cell(line,'A')
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
#   ec.code = ex.cell(line,'A')
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
# 2.upto(5) do |line|
# ReservedCategory.new do |ec|
#   ec.code = ex.cell(line,'A')
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
# 2.upto(6) do |line|
# Religion.new do |ec|
#   ec.code = ex.cell(line,'A')
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
#   ec.code = ex.cell(line,'A')
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
# 2.upto(33) do |line|
# Degree.new do |ec|
#   ec.code = ex.cell(line,'A')
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
#   ec.code = ex.cell(line,'A')
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
# 2.upto(15) do |line|
# DegreeStream.new do |ec|
#   ec.code = ex.cell(line,'A')
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
#   ec.code = ex.cell(line,'A')
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
#   ec.code = ex.cell(line,'A')
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
#   ec.code = ex.cell(line,'A')
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
# 2.upto(23) do |line|
# SalaryComponent.new do |ec|
#   ec.code = ex.cell(line,'A')
#   ec.name = ex.cell(line,'B')
#   ec.description = ex.cell(line,'C')
#   ec.account_code = ex.cell(line,'D')
#   ec.is_deducted = ex.cell(line,'E')
#   ec.save!
# end
# puts "#{i} LeaveCategory inserted.-----------------------------------------------"
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
# ex = Roo::Excel.new("#{Rails.root}/public/emprg.xls")
# ex.default_sheet = ex.sheets[0] 
# i=1

# 2.upto(65) do |line|
# Employee.new do |e|
#   e.manual_employee_code = ex.cell(line,'A').to_i
#   e.first_name = ex.cell(line,'B')
#   e.middle_name = ex.cell(line,'C')
#   e.last_name = ex.cell(line,'D')
#   e.date_of_birth = ex.cell(line,'E')
#   e.contact_no = ex.cell(line,'F').to_i
#   e.email = ex.cell(line,'G')
#   e.permanent_address = ex.cell(line,'H')
#   @country = Country.find_by_name(ex.cell(line,'I'))
#   e.country_id = @country.id unless @country.nil?
#   @state = State.find_by_name(ex.cell(line,'J'))
#   e.state_id = @state.id unless @state.nil?
#   @district = District.find_by_name(ex.cell(line,'K'))
#   e.district_id =  @district.id unless @district.nil?
#   e.city = ex.cell(line,'L')
#   e.pin_code = ex.cell(line,'M').to_i
#   e.current_address = ex.cell(line,'N')
#   e.adhar_no = ex.cell(line,'O')
#   e.pan_no = ex.cell(line,'P')
#   e.licence_no = ex.cell(line,'Q')
#   e.marital_status = ex.cell(line,'R')
#   @nation = Nationality.find_by_name(ex.cell(line,'S'))
#   e.nationality_id = @nation.id unless @nation.nil?
#   @blood = BloodGroup.find_by_name(ex.cell(line,'T'))
#   e.blood_group_id = @blood.id unless @blood.nil?
#   e.handicap = ex.cell(line,'U')
#   e.handicap_type = ex.cell(line, 'V')
#   e.status = ex.cell(line,'W')
#   @type = EmployeeType.find_by_name(ex.cell(line,'X'))
#   e.employee_type_id = @type.id unless @type.nil?
#   e.gender = ex.cell(line,'Y')
#   @religion = Religion.find_by_name(ex.cell(line,'Z'))
#   e.religion_id = @religion.id unless @religion.nil?
  
#   e.department_id = ex.cell(line,'AC').to_i
#   e.company_location_id = ex.cell(line,'AB').to_i
#   e.company_id = ex.cell(line,'AA').to_i
#   e.save!
# end
# puts "#{i} Employee inserted.-----------------------------------------------"
# i = i+1
# end


# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/employe.xls")
# ex.default_sheet = ex.sheets[0] 
# i=1
# 3.upto(510) do |line|
# @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
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


# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/Leave Details.xls")
# ex.default_sheet = ex.sheets[0] 
# i=1

# 2.upto(190) do |line|
# @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
# EmployeeLeavBalance.new do |j|
#   j.employee_id = @employee.id unless @employee.nil?
#   j.leav_category_id = ex.cell(line,'B')
#   j.no_of_leave = ex.cell(line,'C')
#   j.expiry_date = ex.cell(line,'D')
#   j.total_leave = ex.cell(line,'E')
#   j.save!
# end
# puts "#{i} Record inserted.-----------------------------------------------"
# i = i+1
# end


# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/j.xls")
# ex.default_sheet = ex.sheets[0] 
# i=1

# 2.upto(65) do |line|
# @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
# JoiningDetail.new do |j|
#   j.employee_id = @employee.id unless @employee.nil?
#   j.joining_date = ex.cell(line,'B')

#   @designation = EmployeeDesignation.find_by_name(ex.cell(line,'C'))
#   j.employee_designation_id = @designation.id unless @designation.nil?

#   @grade = EmployeeGrade.find_by_name(ex.cell(line,'D'))
#   j.employee_grade_id = @grade.id unless @grade.nil?

#   @category = EmployeeCategory.find_by_name(ex.cell(line,'E'))
#   j.employee_category_id = @category.id unless @category.nil?

#   j.passport_no = ex.cell(line,'F')
#   j.save!
# end
# puts "#{i} Record inserted.-----------------------------------------------"
# i = i+1
# end