require 'rubygems'
require 'roo'
puts "Starting ..."
ex = Roo::Excel.new("#{Rails.root}/public/sg_leave_balance.xls")
ex.default_sheet = ex.sheets[0]
i=1

2.upto(457) do |line|
@employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
puts "#{(ex.cell(line,'A'))} Record inserted. #{@employee.id}-----------------------------------------------"
EmployeeLeavBalance.new do |j|

  j.employee_id = @employee.id unless @employee.nil?
  puts "#{(ex.cell(line,'A'))} Record inserted........Employee ID #{@employee.id}-----------------------------------------------"
  j.leav_category_id = ex.cell(line,'C').to_i
  puts "#{(ex.cell(line,'C'))} Record inserted.-----------------------------------------------"
  j.no_of_leave = ex.cell(line,'D').to_f
  # j.expiry_date = ex.cell(line,'E')
  j.total_leave = ex.cell(line,'E').to_f
  j.from_date = ex.cell(line,'F')
  j.to_date = ex.cell(line,'G')

  j.save!
end
puts "#{i} Record inserted.-----------------------------------------------"
i = i+1
end