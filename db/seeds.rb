require 'rubygems'
require 'roo'
#================================== HCM MASTER END===============================# 
  
# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/designation.xls")
# ex.default_sheet = ex.sheets[0] 
# i=1
# 2.upto(241) do |line|
# @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
# ChangeDesignation.new do |b|
#   b.employee_id = @employee.id unless @employee.nil?
#   @designation = EmployeeDesignation.find_by_name(ex.cell(line,'B'))
#   b.employee_designation_id = @designation.id
#   b.effective_from = ex.cell(line,'C')
#   b.save!
# end
# puts "#{i} Record inserted.-----------------------------------------------"
# i = i+1
# end

#================================== DEPARTMENT ==================================#



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
# ex = Roo::Excel.new("#{Rails.root}/public/sp_employee.xls")
# ex.default_sheet = ex.sheets[0] 
# i=1
# 2.upto(83) do |line|
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
#   # e.contact_no = ex.cell(line,'V').to_i
#   e.email = ex.cell(line,'W')
#   # e.email = ex.cell(line,'X')
#   e.handicap = ex.cell(line,'Y')
#   e.handicap_type = ex.cell(line, 'Z')
  
#   @type = EmployeeType.find_by_name(ex.cell(line,'AA'))
#   e.employee_type_id = @type.id unless @type.nil?

#   e.status = ex.cell(line,'AB')
  
#   # e.company_id = ex.cell(line,'AA').to_i
#   @type1 = Company.find_by_name(ex.cell(line,'AC'))
#   e.company_id = @type1.id unless @type1.nil?
#   @type1 = CompanyLocation.find_by_name(ex.cell(line,'AD'))
#   e.company_location_id = @type1.id unless @type1.nil?
#   @type2 = Department.find_by_name(ex.cell(line,'AE'))
#   e.department_id =  @type2.id unless @type2.nil?

#   @code_master = EmployeeCodeMaster.find_by_name(ex.cell(line,'AF'))
#   e.employee_code_master_id = @code_master.id unless @code_master.nil?

#   e.save!
# end
# puts "#{i} Employee inserted.-----------------------------------------------"
# i = i+1
# end


# #========================= EMPLOYEE BASIC DATA END ===========================================

# #========================= EMPLOYEE ON BOARDING DATA START ===================================

# ex = Roo::Excel.new("#{Rails.root}/public/promotion1.xls")
# ex.default_sheet = ex.sheets[0] #siya feb
# i = 1
# ActiveRecord::Base.transaction do
# 1.upto(182) do |line| # siya Feb 2016
#  puts "Starting Record --------------------------#{ex.cell(line,'A')}"
#  @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
#  # JoiningDetail.where(id: @employee.id).update_all(is_da: true)
#  unless @employee.nil?

#  @employee_promotions = EmployeePromotion.where(employee_id: @employee.id)
#   @employee_promotions.new do |e|

#   	@type2 = Department.find_by_name(ex.cell(line,'B'))
#      e.department_id =  @type2.id unless @type2.nil?
#      @designation = EmployeeDesignation.find_by_name(ex.cell(line,'C'))
#      e.employee_designation_id = @designation.id unless @designation.nil?
#      @grade = EmployeeGrade.find_by_name(ex.cell(line,'D'))
#      e.employee_grade_id = @grade.id unless @grade.nil?
#      @category = EmployeeCategory.find_by_name(ex.cell(line,'E'))
#      e.employee_category_id = @category.id unless @category.nil?
#      e.effective_from = ex.cell(line,'F')
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
# ex = Roo::Excel.new("#{Rails.root}/public/b_sp.xls")
# ex.default_sheet = ex.sheets[0] 
# i=1
# 2.upto(83) do |line|
# @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
# EmployeeBankDetail.new do |b|
#   b.employee_id = @employee.id unless @employee.nil?
#   b.account_no = ex.cell(line,'C').to_i
#   b.bank_name = ex.cell(line,'B')
#   b.branch_name = ex.cell(line,'D')
#   b.address = ex.cell(line,'J')
#   b.contact_no = ex.cell(line,'H').to_i
#   b.micr_code = ex.cell(line,'G')
#   b.branch_code = ex.cell(line,'F')
#   b.ifsc_code = ex.cell(line,'E')
#   @bankname = Bank.find_by_name(ex.cell(line,'B'))
#   b.bank_id = @bankname.id unless @bankname.nil?

#   b.save!
# end
# puts "#{i} Record inserted.-----------------------------------------------"
# i = i+1
# end


# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/sp_leave_bal.xls")
# ex.default_sheet = ex.sheets[0] 
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

# ex = Roo::Excel.new("#{Rails.root}/public/joining_detail_report.xls")
# ex.default_sheet = ex.sheets[2] #siya feb
# i = 1
# ActiveRecord::Base.transaction do
# 2.upto(169) do |line| # siya Feb 2016
#  puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
#  @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A'))
#  # JoiningDetail.where(id: @employee.id).update_all(is_da: true)
#  puts "#{i} Record inserted.-----------------------------------------------"
#  unless @employee.nil?
#  @joining_details = JoiningDetail.where(employee_id: @employee.id)

#   @joining_details.each do |e|
#     e.is_employeer_pf = ex.cell(line,'B').to_s
#      e.select_pf = ex.cell(line,'C').to_s
#      e.employee_pf_no = ex.cell(line,'D').to_s

#     e.save!
#    end
#    puts "#{i} Record inserted.-----------------------------------------------"
#    i += 1
#  end
#  end
# end

# ex = Roo::Excel.new("#{Rails.root}/public/rgfdj.xls")
#  ex.default_sheet = ex.sheets[4] #siya feb
#  i = 1
#  ActiveRecord::Base.transaction do

#  2.upto(89) do |line| # siya Feb 201
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

# ex = Roo::Excel.new("#{Rails.root}/public/rgfdf.xls")
#  ex.default_sheet = ex.sheets[3] #siya feb
#  i = 1
#  ActiveRecord::Base.transaction do

#  2.upto(74) do |line| # siya Feb 201
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
# ex = Roo::Excel.new("#{Rails.root}/public/rgebd.xls")
# ex.default_sheet = ex.sheets[2] 
# i=1
# 2.upto(145) do |line|
# @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
# EmployeeBankDetail.new do |b|
#   b.employee_id = @employee.id unless @employee.nil?
#   b.account_no = ex.cell(line,'B').to_i
#   b.bank_name = ex.cell(line,'C')
#   b.branch_name = ex.cell(line,'D')
#   # b.address = ex.cell(line,'A')
#   b.contact_no = ex.cell(line,'E').to_i
#   b.micr_code = ex.cell(line,'F').to_i
#   b.branch_code = ex.cell(line,'G').to_i
#   b.ifsc_code = ex.cell(line,'H')
#   b.bank_id = ex.cell(line,'I').to_i
#   b.save!
# end
# puts "#{i} Record inserted.-----------------------------------------------"
# i = i+1
# end

# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/j.xls")
# ex.default_sheet = ex.sheets[0]
# i=1

# 2.upto(163) do |line|
# @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A'))
# JoiningDetail.new do |j|
#   j.employee_id = @employee.id unless @employee.nil?

#   j.employee_uan_no = ex.cell(line,'B')
#   j.joining_date = ex.cell(line,'C')
#   j.confirmation_date = ex.cell(line,'D')

#   @designation = EmployeeDesignation.find_by_name(ex.cell(line,'E'))
#   j.employee_designation_id = @designation.id unless @designation.nil?

#   @grade = EmployeeGrade.find_by_name(ex.cell(line,'F'))
#   j.employee_grade_id = @grade.id unless @grade.nil?

#   j.select_pf = ex.cell(line,'G')
#   j.employee_pf_no = ex.cell(line,'H')
#   j.pf_max_amount = ex.cell(line,'I')
#   j.have_esic = ex.cell(line,'J')
#   j.employee_efic_no = ex.cell(line,'K')

#   @pay_mode = PaymentMode.find_by_name(ex.cell(line,'L'))
#   j.payment_mode_id = @pay_mode.id unless @pay_mode.nil?

#   @cost_center = CostCenter.find_by_name(ex.cell(line,'M'))
#   j.cost_center_id = @cost_center.id unless @cost_center.nil?

#   @category = EmployeeCategory.find_by_name(ex.cell(line,'N'))
#   j.employee_category_id = @category.id unless @category.nil?

#   j.medical_schem = ex.cell(line,'O')
#   j.probation_period = ex.cell(line,'P')
#   j.notice_period = ex.cell(line,'Q')
#   j.have_passport = ex.cell(line,'R')
#   j.passport_no = ex.cell(line,'S')
#   j.passport_issue_date = ex.cell(line,'T')
#   j.passport_expiry_date = ex.cell(line,'U')
#   j.have_retention = ex.cell(line,'V')
#   j.retirement_date = ex.cell(line,'W')

#   @reserved_category = ReservedCategory.find_by_name(ex.cell(line,'X'))
#   j.reserved_category_id = @reserved_category.id unless @reserved_category.nil?


#   # j.is_employeer_pf = ex.cell(line,'Y')
#   # j.is_employeer_esic = ex.cell(line,'Z')
#   # j.is_insurance = ex.cell(line,'AA')
#   # j.is_family_pension = ex.cell(line,'AB')
#   # j.is_bonus = ex.cell(line,'AC')
#   j.save!
# end
# puts "#{i} Record inserted.-----------------------------------------------"
# i = i+1
# end


# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/rgl.xls")
# ex.default_sheet = ex.sheets[1] 
# i=1

# 2.upto(53) do |line|
# @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
# EmployeeLeavBalance.new do |j|
#   j.employee_id = @employee.id unless @employee.nil?
#   j.leav_category_id = ex.cell(line,'B')
#   j.no_of_leave = ex.cell(line,'C')
#   j.total_leave = ex.cell(line,'D')
#   j.is_active = ex.cell(line,'E')
#   j.save!
# end
# puts "#{i} Record inserted.-----------------------------------------------"
# i = i+1
# end

# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/passout_year.xls")
# ex.default_sheet = ex.sheets[0] 
# i=1

# 2.upto(51) do |line|
# Year.new do |j|
#   j.name = ex.cell(line,'A')
#   j.save!
# end
# puts "#{i} Record inserted.-----------------------------------------------"
# i = i+1
# end

# puts "Starting ..."
# ex = Roo::Excel.new("#{Rails.root}/public/passout_year.xls")
# ex.default_sheet = ex.sheets[1] 
# i=1

# 2.upto(44) do |line|
# University.new do |j|
#   j.name = ex.cell(line,'A')
#   j.save!
# end
# puts "#{i} Record inserted.-----------------------------------------------"
# i = i+1
# end


# ex = Roo::Excel.new("#{Rails.root}/public/employee_qualification.xls")
# ex.default_sheet = ex.sheets[0] #siya feb
# i = 1
# ActiveRecord::Base.transaction do
# 2.upto(154) do |line| # siya Feb 2016
#  puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
#  @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)

#    Qualification.new do |qual|
#    	qual.employee_id = @employee.id
#    	puts "#{i} Employee inserted.-----------------------------------------------"

#    	@qualification_level = DegreeType.find_by_name(ex.cell(line,'B'))
#    	qual.degree_type_id = @qualification_level.id
#    	puts "#{i} Qualification Level inserted.-----------------------------------------------"

#    	@qualification = Degree.find_by_name(ex.cell(line,'C'))
#    	qual.degree_id = @qualification.id
#    	puts "#{i} Qualification inserted.-----------------------------------------------"

#    	@qualification_specialization = DegreeStream.find_by_name(ex.cell(line,'D'))
#    	qual.degree_stream_id = @qualification_specialization.id
#    	puts "#{i} Qualification Specialization inserted.-----------------------------------------------"

#    	qual.marks = ex.cell(line,'E')
#    	puts "#{i} Marks inserted.-----------------------------------------------"

#    	@passout_year = Year.find_by_name(ex.cell(line,'F'))
#    	qual.year_id = @passout_year.id
#    	puts "#{i} Passout Year inserted.-----------------------------------------------"

#    	qual.college = ex.cell(line,'G')
#    	puts "#{i} College inserted.-----------------------------------------------"

#    	@university = University.find_by_name(ex.cell(line,'H'))
#    	qual.university_id = @university.id
#    	puts "#{i} Passout Year inserted.-----------------------------------------------"

   	
#     qual.save!
#    end
#    puts "#{i} Record inserted.-----------------------------------------------"
#    i += 1
#  end
#  end


# ex = Roo::Excel.new("#{Rails.root}/public/employee_experience.xls")
# ex.default_sheet = ex.sheets[0] #siya feb
# i = 1
# ActiveRecord::Base.transaction do
# 2.upto(93) do |line| # siya Feb 2016
#  puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
#  @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)

#    Experience.new do |exp|
#    	exp.employee_id = @employee.id
#    	puts "#{i} Employee inserted.-----------------------------------------------"

#    	exp.company_name = ex.cell(line,'B')
#    	puts "#{i} Company Name inserted.-----------------------------------------------"

#     exp.designation = ex.cell(line,'C')
#    	puts "#{i} Designation inserted.-----------------------------------------------"

#    	exp.no_of_year = ex.cell(line,'D')
#    	puts "#{i} No of Year inserted.-----------------------------------------------"

#    	exp.ctc = ex.cell(line,'E')
#    	puts "#{i} CTC inserted.-----------------------------------------------"

#     exp.save!
#    end
#    puts "#{i} Record inserted.-----------------------------------------------"
#    i += 1
#  end
#  end



# ex = Roo::Excel.new("#{Rails.root}/public/HRMSONE EMPLOYEE DATA.xls")
# ex.default_sheet = ex.sheets[1] #siya feb
# i = 1
# ActiveRecord::Base.transaction do
# 2.upto(114) do |line| # siya Feb 2016
#  puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
#  @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A'))
#  # JoiningDetail.where(id: @employee.id).update_all(is_da: true)
#  puts "#{i} Record inserted.-----------------------------------------------"
#  unless @employee.nil?
#  @employees = Employee.where(id: @employee.id)

#    @employees.each do |e|
# #    	@country1 = Country.find_by_name(ex.cell(line,'B'))
# #    	e.update country_id: @country1.id
# #    	puts "#{i} Country inserted.-----------------------------------------------"
# #    	@state1 = State.find_by_name(ex.cell(line,'C'))
# #    	e.update state_id: @state1.id
# #    	puts "#{i} State Record inserted.-----------------------------------------------"
# #    	@district1 = District.find_by_name(ex.cell(line,'D'))
# #    	e.update district_id: @district1.id
# #    	puts "#{i} District Record inserted.-----------------------------------------------"

#   e.update(manual_employee_code: ex.cell(line,'A').to_i)
#   e.update(first_name: ex.cell(line,'B'))
#   e.update(middle_name: ex.cell(line,'C'))
#   e.update(last_name: ex.cell(line,'D'))
#   e.update(gender: ex.cell(line,'E'))
#   e.update(adhar_no: ex.cell(line,'F').to_i)
#   e.update(pan_no: ex.cell(line,'G'))
#   e.update(licence_no: ex.cell(line,'H'))
#   # e.update(marital_status: ex.cell(line,'I'))
#   # @nation = Nationality.find_by_name(ex.cell(line,'J'))
#   # e.update(nationality_id: @nation.id unless @nation.nil?)
#   # e.update(date_of_birth: ex.cell(line,'K'))
#   # @blood = BloodGroup.find_by_name(ex.cell(line,'L'))
#   # e.update(blood_group_id: @blood.id unless @blood.nil?)
#   e.update(permanent_address: ex.cell(line,'J'))
#   e.update(pin_code: ex.cell(line,'K').to_i)
#   # @country = Country.find_by_name(ex.cell(line,'O'))
#   # e.update(country_id: @country.id unless @country.nil?)
#   # @state = State.find_by_name(ex.cell(line,'P'))
#   # e.update(state_id: @state.id unless @state.nil?)
#   # @district = District.find_by_name(ex.cell(line,'Q'))
#   # e.update(district_id:  @district.id unless @district.nil?)
#   e.update(city: ex.cell(line,'L'))
#   e.update(current_address: ex.cell(line,'M'))
#   # @religion = Religion.find_by_name(ex.cell(line,'T'))
#   # e.update(religion_id: @religion.id unless @religion.nil?)
#   e.update(contact_no: ex.cell(line,'O').to_i)
#   e.update(email: ex.cell(line,'P'))
#   e.update(handicap: ex.cell(line,'Q'))
#   e.update(handicap_type: ex.cell(line, 'R'))
#     e.save!
#    end
#    puts "#{i} Record inserted.-----------------------------------------------"
#    i += 1
#  end
#  end
# end


# ex = Roo::Excel.new("#{Rails.root}/public/HRMSONE Employee On Boarding  Data.xls")
# ex.default_sheet = ex.sheets[1] #siya feb
# i = 1
# ActiveRecord::Base.transaction do
# 2.upto(114) do |line| # siya Feb 2016
#  puts "Starting Record --------------------------#{ex.cell(line,'A')}"
#  @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
#  # JoiningDetail.where(id: @employee.id).update_all(is_da: true)
#  unless @employee.nil?
#  @joining_details = JoiningDetail.where(employee_id: @employee.id)

#   @joining_details.each do |e|
#      e.employee_uan_no = ex.cell(line,'B').to_i
#      e.employee_pf_no = ex.cell(line,'F').to_i
#      e.joining_date =  ex.cell(line,'C')
#      e.confirmation_date =  ex.cell(line,'D')
#      e.probation_period = ex.cell(line,'J').to_i
#      e.notice_period =     ex.cell(line,'K').to_i
#      e.passport_no = ex.cell(line,'M').to_i
#      e.have_passport = ex.cell(line,'L')
#      e.passport_issue_date = ex.cell(line,'N')
#      e.passport_expiry_date = ex.cell(line,'O')
#     e.save!
#    end
#    puts "#{i} Record inserted.------#{ex.cell(line,'B')}--------------------#{ex.cell(line,'C')}--------------"
#    i += 1
#  end
#  end
# end


# ex = Roo::Excel.new("#{Rails.root}/public/HRMSONE EMPLOYEE BANK DATA.xls")
# ex.default_sheet = ex.sheets[1] #siya feb
# i = 1
# ActiveRecord::Base.transaction do
# 2.upto(114) do |line| # siya Feb 2016
#  puts "Starting Record --------------------------#{ex.cell(line,'A')}"
#  @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
#  # JoiningDetail.where(id: @employee.id).update_all(is_da: true)
#  unless @employee.nil?
#  @employee_bank_details = EmployeeBankDetail.where(employee_id: @employee.id)

#   @employee_bank_details.each do |e|
#     e.account_no = ex.cell(line,'B').to_i
#     e.bank_name = ex.cell(line,'C')
#     e.branch_name = ex.cell(line,'D')
#     e.contact_no = ex.cell(line,'E').to_i
#     e.micr_code = ex.cell(line,'F').to_i
#     e.branch_code = ex.cell(line,'G').to_i
#     e.ifsc_code = ex.cell(line,'H')
#     e.save!
#    end
#    puts "#{i} Record inserted.------#{ex.cell(line,'B')}--------------------#{ex.cell(line,'C')}--------------"
#    i += 1
#  end
#  end
# end

#========================= EMPLOYEE BASIC DATA END ===========================================
# ex = Roo::Excel.new("#{Rails.root}/public/food.xls")
#  ex.default_sheet = ex.sheets[0] #siya feb
#  i = 1
#  ActiveRecord::Base.transaction do

#  2.upto(89) do |line| # siya Feb 201
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

 ex = Roo::Excel.new("#{Rails.root}/public/attendance_july.xls")
 ex.default_sheet = ex.sheets[0] #siya feb
 i = 1
 ActiveRecord::Base.transaction do
 2.upto(196) do |line| # siya Feb 201
   puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
   @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
   unless @employee.nil?
     Workingday.new do |w|
       w.employee_id = @employee.id
       w.month_name = ex.cell(line, 'B')
       w.year = ex.cell(line, 'C').to_i
       w.day_in_month = ex.cell(line, 'D')
       # w.week_off_day = ex.cell(line, 'E').to_i
       # w.holiday_in_month = ex.cell(line, 'F')
       # w.pay_leave = ex.cell(line, 'G').to_i
       # w.nonpay_leave = ex.cell(line, 'K')
       w.payable_day = ex.cell(line, 'E')
       w.save!
     end
     puts "#{i} Record inserted.-----------------------------------------------"
     i += 1
   end
   end
end

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

