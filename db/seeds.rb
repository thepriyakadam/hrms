require 'roo'

# ex = Roo::Excel.new("#{Rails.root}/public/slip.xls")
# ex.default_sheet = ex.sheets[0]
# 2.upto(356) do |line|
#   puts "Starting Record #{ex.cell(line,'A')}---------------"
#   @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
#   @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)

#   workingday = Workingday.where(month_name: "January", year: "2016", employee_id: @employee.id).take
#   salaryslip = Salaryslip.where(month: "January", year: "2016", employee_id: @employee.id).take
#   unless salaryslip.nil?
#     SlipInformation.new do |s|
#       s.salaryslip_id = salaryslip.id
#       s.cost_center_id = @joining_detail.cost_center_id
#       s.department_id = @employee.department_id
#       s.contact_no = @employee.contact_no
#       s.esic_no = @joining_detail.employee_efic_no
#       s.pf_no = @joining_detail.employee_pf_no
#       s.uan_no = @joining_detail.employee_uan_no
#       s.save
#     end
#   end
# end


ex = Roo::Excel.new("#{Rails.root}/public/june.xls")

ex.default_sheet = ex.sheets[0]

i = 1
gross_salary = 0
ActiveRecord::Base.transaction do
#2.upto(372) do |line|

2.upto(370) do |line|

  puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"

  @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
  unless @employee.nil?
    Workingday.new do |w|
      w.employee_id = @employee.id
      w.month_name = ex.cell(line,'B')
      w.year = ex.cell(line,'C').to_i

      w.lwp_leave = ex.cell(line, 'D').to_i
      w.cl_leave = ex.cell(line, 'E').to_i
      w.el_leave = ex.cell(line, 'F').to_i
      w.esic_leave = ex.cell(line, 'G').to_i

      w.day_in_month = ex.cell(line, 'H')
      w.present_day = ex.cell(line, 'I')
      w.holiday_in_month = ex.cell(line, 'J')

      w.week_off_day = ex.cell(line, 'K')
      w.absent_day = ex.cell(line, 'L')
      w.payable_day = ex.cell(line, 'M')
      w.save!
    end
    puts "#{i} Record inserted.-----------------------------------------------"
    i = i+1
  end
end

end