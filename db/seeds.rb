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
ex = Roo::Excel.new("#{Rails.root}/public/employee.xls")
ex.default_sheet = ex.sheets[1] 
i=1
3.upto(490) do |line|
Employee.new do |e|
  e.manual_employee_code = ex.cell(line,'A').to_i
  e.first_name = ex.cell(line,'B')
  e.middle_name = ex.cell(line,'C')
  e.last_name = ex.cell(line,'D')
  e.gender = ex.cell(line,'E')
  e.religion_id = 1 #ex.cell(line,'F')
  e.date_of_birth = ex.cell(line,'G')
  e.permanent_address = ex.cell(line,'H')
  e.pin_code = ex.cell(line,'I')
  e.country_id = 103 #ex.cell(line,'J')
  e.state_id = 20 #ex.cell(line,'K')
  e.district_id = 24 #ex.cell(line,'L')
  e.city = ex.cell(line,'M')
  e.current_address = ex.cell(line,'N')
  e.contact_no = ex.cell(line,'O')
  #e.email = ex.cell(line,'P')
  e.employee_type_id = 1 #ex.cell(line,'Q')
  e.status = ex.cell(line,'R')
  e.handicap = 'NO' #ex.cell(line,'S')
  e.handicap_type = "" #ex.cell(line,'T')
  e.save!


end
@employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
JoiningDetail.new do |j|
  j.employee_id = @employee.id
  j.joining_date = ex.cell(line,'U')
  j.employee_designation_id = ex.cell(line,'V')
  j.employee_grade_id = ex.cell(line,'W')
  j.confirmation_date = ex.cell(line,'X')
  j.medical_schem = ex.cell(line,'Y')
  j.passport_no = ex.cell(line,'Z')
  j.passport_issue_date = ex.cell(line,'AA')
  j.passport_expiry_date = ex.cell(line,'AB')

  # j.status = 
  # j.probation_period = 
  # j.notice_period =
  # j.is_medical = 
  # j.have_passport =
  # j.employee_uan_id = 
  # j.employee_pf_no = 
  # j.employee_efic_no = 
  j.save!
end

EmployeeBankDetail.new do |b|
  b.employee_id = @employee.id
  b.account_no = ex.cell(line,'AC')
  b.bank_name = ex.cell(line,'AD')
  b.branch_name = ex.cell(line,'AE')
  b.branch_code = ex.cell(line,'AF')
  b.ifsc_code = ex.cell(line,'AG')
  b.address = ex.cell(line,'AH')
  # b.contact_no = 
  # b.micr_code =   
  b.save!
end
puts "#{i} Record inserted."
i = i+1
end

