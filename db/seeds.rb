require 'roo'
ex = Roo::Excel.new("#{Rails.root}/public/leave siya.xls")
ex.default_sheet = ex.sheets[4]
2.upto(93) do |line|
  puts "Starting Record #{ex.cell(line,'A')}---------------"
  @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)

  workingday = Workingday.where(month_name: "May", year: "2016", employee_id: @employee.id).take
  unless workingday.nil?
    workingday.cl_leave = ex.cell(line,'B').to_f
    workingday.el_leave = ex.cell(line,'C').to_f

    workingday.cl_balance = ex.cell(line,'D').to_f
    workingday.el_balance = ex.cell(line,'E').to_f
    workingday.save
  end
end