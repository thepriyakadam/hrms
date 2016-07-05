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

ex = Roo::Excel.new("#{Rails.root}/public/slip.xls")
<<<<<<< HEAD
ex.default_sheet = ex.sheets[5]
ActiveRecord::Base.transaction do 
  3.upto(370) do |line|
    puts "Starting Record #{ex.cell(line,'A')}---------------"
    @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
    unless @employee.nil?
      @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
      workingday = Workingday.where(month_name: "June", year: "2016", employee_id: @employee.id).take
      salaryslip = Salaryslip.where(month: "June", year: "2016", employee_id: @employee.id).take
      unless salaryslip.nil? or workingday.nil? or salaryslip.nil?
        SlipInformation.new do |s|
          s.salaryslip_id = salaryslip.id
          s.cost_center_id = @joining_detail.cost_center_id
          s.department_id = @employee.department_id
          s.contact_no = @employee.contact_no
          s.esic_no = @joining_detail.employee_efic_no
          s.pf_no = @joining_detail.employee_pf_no
          s.uan_no = @joining_detail.employee_uan_no
          # s.cl = workingday.cl_leave
          # s.el = workingday.el_leave
          # s.c_off = workingday.coff_leave
          # #s.advance = 
          # @leave_balances = EmployeeLeavBalance.where(employee_id: @employee.id)
          # @leave_balances.each do |b|
          #   if b.leav_category.name == "Casual Leave"
          #     s.cl_b = b.no_of_leave
          #   elsif b.leav_category.name == "Earned Leave"
          #     s.el_b = b.no_of_leave
          #   elsif b.leav_category.name == "Advance Leave"
          #     s.advance_b = b.no_of_leave
          #   elsif b.leav_category.name == "C.Off"
          #     s.c_off_b = b.no_of_leave
          #   end
          # end
          s.save
        end
      end 
    end 
=======
ex.default_sheet = ex.sheets[0]
2.upto(356) do |line|
  puts "Starting Record #{ex.cell(line,'A')}---------------"
  @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)

  workingday = Workingday.where(month_name: "January", year: "2016", employee_id: @employee.id).take
  unless workingday.nil?
    workingday.cl_leave = ex.cell(line,'E').to_f
    workingday.el_leave = ex.cell(line,'F').to_f

    workingday.cl_balance = ex.cell(line,'G').to_f
    workingday.el_balance = ex.cell(line,'H').to_f
    workingday.save
>>>>>>> 0343f137848926d1af1d0005e96bf2a6863db887
  end
end