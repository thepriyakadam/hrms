require 'rubygems'
require 'roo'
puts "Starting ..."
ex = Roo::Excel.new("#{Rails.root}/public/CompanyLocation.xls")
ex.default_sheet = ex.sheets[0] 
i = 1
2.upto(692) do |line|
company_location = CompanyLocation.find_by_name(ex.cell(line,'B'))
if company_location.present?
	@company_location_id = company_location.id
else
	@company_location_id = 22
end
Department.new do |d|
	d.company_location_id = @company_location_id
	d.manual_department_code = ex.cell(line,'c')
	d.department_code = ex.cell(line,'d')
	d.description = ex.cell(line,'e')
	d.name = ex.cell(line,'f')
	d.department_type_id = ex.cell(line,'g')
	d.contact_no = ex.cell(line,'h')
	d.is_confirm = ex.cell(line,'i')
	d.save!
end
puts "#{i} Record inserted.-----------------------------------------------"
i = i + 1
end
