# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Examples:

#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'Company Type Started...'
company_type_array = ['Information Technology','Finance','chemical','Production']

company_type_array.each do |ct|
	company_type = CompanyType.find_or_initialize_by(name: ct)
	company_type.name = ct
	company_type.save
end

puts 'Department Type Started...'
dept_type = ['IT','Finance','Hr']
dept_type.each do |d|
	DepartmentType.create(name: d)
end

emp_type = ['Temporary','Permanent']
emp_type.each do |e|
	EmployeeType.create(name: e)
end

natinality = ['Indian','US','UK']
natinality.each do |n|
	Nationality.create(name: n)
end

blood_group = ['A','B','AB','O']
blood_group.each do |d|
	BloodGroup.create(name: d)
end

employee_grade = ['G1','G2','G3','G4']
employee_grade.each do |d|
	EmployeeGrade.create(name: d)
end

leave_categories = ['Seak Leave','Casual Leave','Maternal Leave','Paternal Leave']
leave_categories.each do |d|
	LeavCategory.create(name: d)
end

roles = ['Company','CompanyLocation','Department','Employee']
roles.each do |r|
	Role.create(name: r)
end

degrees =['SSC','HSC','DEPLOMA','ITI','BA','BSC','BCA','B.COM','BE','B.TECH','BBA','MA','MSC','MCA','M.COM','ME','M.TECH','MBA']
degrees.each do |d|
	Degree.create(name:d)
end

employee_designation_array = ['HR','Software Developer','Tester']
employee_designation_array.each do |d|
	EmployeeDesignation.create(name: d)
end

puts 'Year Started...'
for i in 1960..Date.today.year
	Year.create(name:i)
end

puts 'Countries Started...'
CS.countries.each {|k,v| Country.create(code: k, name: v)}
puts 'States Started...'
CS.states(:in).each {|k,v| c = Country.find_by_code('IN'); c.states.create(code: k,name: v)}
puts 'District Started...'
CS.states(:in).each {|k,v| s = State.find_by_code(k); CS.cities(k,:in).each {|c| s.districts.create(name: c)}}
