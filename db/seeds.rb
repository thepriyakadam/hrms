# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
com_type = ['IT','Finance','chemical']
com_type.each do |c|
	CompanyType.create(name: c)
end

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