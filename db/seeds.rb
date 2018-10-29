require 'rubygems'
require 'roo'
puts "Starting ..."
#ex = Roo::Excel.new("#{Rails.root}/public/CompanyLocation.xls")
ex = Roo::Excel.new("#{Rails.root}/public/CompanyL.xls")
ex.default_sheet = ex.sheets[0] 
i = 1
58.upto(229) do |line|
	company_location = CompanyLocation.find_by_name(ex.cell(line,'B'))
	if company_location.present?
		@company_location_id = company_location.id
	else
		@company_location_id = 22
	end
	Department.new do |d|
		d.company_location_id = @company_location_id
		d.manual_department_code = ex.cell(line,'C')
		d.department_code = ex.cell(line,'D')
		d.description = ex.cell(line,'E')
		d.name = ex.cell(line,'F')
		d.department_type_id = ex.cell(line,'G')
		d.contact_no = ex.cell(line,'H')
		d.is_confirm = ex.cell(line,'I')
		d.save!
	end
	puts "#{i} Record inserted.-----------------------------------------------"
	i = i+1
end
