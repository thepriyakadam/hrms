
require 'rubygems'
require 'roo'

# ex = Roo::Excel.new("#{Rails.root}/public/1.xls")
# ex.default_sheet = ex.sheets[0]
# j = 1
# 2.upto(27) do |line|
#   puts "Starting Record---------------------------------------"
#   @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
  
#   unless @employee.nil?
#     Instalment.n do |a|
#       a.employee_id = @employee.id  
#       a.advance_date = ex.cell(line,'C').to_date unless ex.cell(line,'C').nil?
#       a.advance_amount = ex.cell(line,'D').to_f unless ex.cell(line,'D').nil?
#       a.instalment_amount = ex.cell(line,'F').to_f unless ex.cell(line,'F').nil?
#       #a.no_of_instalment = ex.cell(line,'E').to_i
#       unless a.advance_amount.nil? and a.instalment_amount.nil?
#       a.no_of_instalment = (a.advance_amount.to_i / a.instalment_amount).ceil
#       end
#       a.save!
#     end

#     @advance_salary = AdvanceSalary.find_by_employee_id(@employee.id)
#     unless @advance_salary.nil?
#       for i in 1..@advance_salary.no_of_instalment.to_i
#         Instalment.new do |i|
#           i.advance_salary_id = @advance_salary.id
#           #i.instalment_date = 
#           i.instalment_amount = @advance_salary.instalment_amount
#           i.save!
#         end
#       end
#     end
#   end
# end
ex = Roo::Excel.new("#{Rails.root}/public/2.xls")
# ex = Roo::Excel.new("#{Rails.root}/public/Employee Wise_Service Master.xls")
ex.default_sheet = ex.sheets[0] #siya feb
i = 1
ActiveRecord::Base.transaction do
2.upto(107) do |line| # siya Feb 2016
 puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
  @installment = Instalment.find_by_id(ex.cell(line,'A').to_i)
 puts "#{i} Record inserting.----------------------------"

 Instalment.where(id: @installment).update_all(instalment_date: (ex.cell(line,'C')))
 # JoiningDetail.where(employee_pf_no: ex.cell(line,'D').to_s)
 puts "#{i} Record inserted.-----------------------------------------------"
 i += 1
 end
 end