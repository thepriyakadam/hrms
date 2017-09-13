require 'rubygems'
require 'roo'
ex = Roo::Excel.new("#{Rails.root}/public/workingday.xls")
 ex.default_sheet = ex.sheets[1] #siya feb
 i = 1
 ActiveRecord::Base.transaction do

 2.upto(91) do |line| # siya Feb 201
   puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
   @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
   unless @employee.nil?

     FoodDeduction.new do |w|
       w.employee_id = @employee.id
       w.no_of_coupan = ex.cell(line, 'B')
       w.return_coupan = ex.cell(line, 'C').to_i
       w.total_coupan = ex.cell(line, 'D')
       w.food_coupan_master_id = ex.cell(line, 'E').to_i
       w.amount = ex.cell(line, 'F')
       w.food_date = ex.cell(line, 'G')
       w.save!
     end
     puts "#{i} Record inserted.-----------------------------------------------"
     i += 1
   end
   end
 end

 ex = Roo::Excel.new("#{Rails.root}/public/workingday.xls")
 ex.default_sheet = ex.sheets[0] #siya feb
 i = 1
 ActiveRecord::Base.transaction do

 2.upto(194) do |line| # siya Feb 201
   puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
   @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
   unless @employee.nil?

     Workingday.new do |w|
       w.employee_id = @employee.id
       w.month_name = ex.cell(line, 'B')
       w.year = ex.cell(line, 'C').to_i
       w.day_in_month = ex.cell(line, 'D')
       w.payable_day = ex.cell(line, 'E')
       w.save!
     end
     puts "#{i} Record inserted.-----------------------------------------------"
     i += 1
   end
   end
end