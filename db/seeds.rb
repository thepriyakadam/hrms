require 'rubygems'
require 'roo'
puts "Starting ..."
ex = Roo::Excel.new("#{Rails.root}/public/sg_bank.xls")
ex.default_sheet = ex.sheets[1]
i=1
1.upto(35) do |line|
Employee.new do |e|
  e.manual_employee_code = ex.cell(line,'A').to_i
  e.first_name = ex.cell(line,'B')
  e.middle_name = ex.cell(line,'C')
  e.last_name = ex.cell(line,'D')
  e.gender = ex.cell(line,'E')
  e.adhar_no = ex.cell(line,'F').to_i
  e.pan_no = ex.cell(line,'G')
  e.licence_no = ex.cell(line,'H')
  e.marital_status = ex.cell(line,'I')
  @nation = Nationality.find_by_name(ex.cell(line,'J'))
  e.nationality_id = @nation.id unless @nation.nil?
  e.date_of_birth = ex.cell(line,'K')
  @blood = BloodGroup.find_by_name(ex.cell(line,'L'))
  e.blood_group_id = @blood.id unless @blood.nil?
  e.permanent_address = ex.cell(line,'M')
  e.pin_code = ex.cell(line,'N').to_i
  @country = Country.find_by_name(ex.cell(line,'O'))
  e.country_id = @country.id unless @country.nil?
  @state = State.find_by_name(ex.cell(line,'P'))
  e.state_id = @state.id unless @state.nil?
  @district = District.find_by_name(ex.cell(line,'Q'))
  e.district_id =  @district.id unless @district.nil?
  e.city = ex.cell(line,'R')
  e.current_address = ex.cell(line,'S')
  @religion = Religion.find_by_name(ex.cell(line,'T'))
  e.religion_id = @religion.id unless @religion.nil?
  e.optinal_contact_no = ex.cell(line,'U').to_i
  e.contact_no = ex.cell(line,'V').to_i
  e.optinal_contact_no1 = ex.cell(line,'W').to_i
  e.email = ex.cell(line,'X')
  e.optional_email = ex.cell(line,'Y')
  e.handicap = ex.cell(line,'Z')
  e.handicap_type = ex.cell(line, 'AA')
 
  @employee_type = EmployeeType.find_by_name(ex.cell(line,'AB'))
  e.employee_type_id = @employee_type.id unless @employee_type.nil?

  e.status = ex.cell(line,'AC')
 
  # e.company_id = ex.cell(line,'AA').to_i
  @company_name = Company.find_by_name(ex.cell(line,'AD'))
  e.company_id = @company_name.id unless @company_name.nil?
  @company_location_name = CompanyLocation.find_by_name(ex.cell(line,'AE'))
  e.company_location_id = @company_location_name.id unless @company_location_name.nil?
  @department_name = Department.find_by_name(ex.cell(line,'AF'))
  e.department_id =  @department_name.id unless @department_name.nil?
  @sub_department_name = SubDepartment.find_by_name(ex.cell(line,'AG'))
  e.sub_department_id =  @sub_department_name.id unless @sub_department_name.nil?

  @code_master = EmployeeCodeMaster.find_by_name(ex.cell(line,'AH'))
  e.employee_code_master_id = @code_master.id unless @code_master.nil?

  e.save!
end
puts "#{i} Employee inserted.-----------------------------------------------"
i = i+1
end


# #========================= EMPLOYEE BASIC DATA END ===========================================

# #========================= EMPLOYEE ON BOARDING DATA START ===================================

ex = Roo::Excel.new("#{Rails.root}/public/sg_bank.xls")
ex.default_sheet = ex.sheets[2] #siya feb
i = 1
ActiveRecord::Base.transaction do
2.upto(36) do |line| # siya Feb 2016
 puts "Starting Record --------------------------#{ex.cell(line,'A')}"
 @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
 # JoiningDetail.where(id: @employee.id).update_all(is_da: true)
 unless @employee.nil?

 @joining_details = JoiningDetail.where(employee_id: @employee.id)
  @joining_details.new do |e|
     e.employee_uan_no = ex.cell(line,'C').to_i
     e.joining_date =  ex.cell(line,'D')
     e.confirmation_date =  ex.cell(line,'E')
     @designation = EmployeeDesignation.find_by_name(ex.cell(line,'F'))
     e.employee_designation_id = @designation.id unless @designation.nil?
      @grade = EmployeeGrade.find_by_name(ex.cell(line,'G'))
     e.employee_grade_id = @grade.id unless @grade.nil?
      @cost_unit = CostCenter.find_by_name(ex.cell(line,'H'))
     e.cost_center_id = @cost_unit.id unless @cost_unit.nil?
     # e.employee_pf_no = ex.cell(line,'F').to_i
     @category = EmployeeCategory.find_by_name(ex.cell(line,'I'))
     e.employee_category_id = @category.id unless @category.nil?

     # e.probation_period = ex.cell(line,'H').to_i
     e.probation_period = ex.cell(line,'K').to_i
     e.notice_period =     ex.cell(line,'L').to_i
     e.notice_period_after_probation =     ex.cell(line,'M').to_i

     e.have_passport = ex.cell(line,'N')
     e.passport_no = ex.cell(line,'O').to_i
     e.passport_issue_date = ex.cell(line,'P')
     e.passport_expiry_date = ex.cell(line,'Q')
     e.retirement_date = ex.cell(line,'R')
     e.company_rfid = ex.cell(line,'S').to_i
     e.gate_rfid = ex.cell(line,'T').to_i
    e.save!

    puts "Save...."
   end
   puts "#{i} Record inserted.------#{ex.cell(line,'B')}--------#{ex.cell(line,'C')}---------#{ex.cell(line,'D')}.....#{ex.cell(line,'E')}......#{ex.cell(line,'G')}"
   i += 1
 end
 end
end