require 'rubygems'
require 'roo'
ex = Roo::Excel.new("#{Rails.root}/public/a.xls")
ex.default_sheet = ex.sheets[0] #siya feb
i = 1
ActiveRecord::Base.transaction do
2.upto(88) do |line| # siya Feb 2016
  puts "Starting Record #{ex.cell(line,'A')}---------------------------------------"
  @employee = Employee.find_by_manual_employee_code(ex.cell(line,'A').to_i)
  unless @employee.nil?

    Workingday.new do |w|
      w.employee_id = @employee.id
      w.month_name = ex.cell(line, 'B')
      w.year = ex.cell(line, 'C').to_i


      w.day_in_month = ex.cell(line, 'E')
      w.present_day = ex.cell(line, 'F')
     
      w.payable_day = ex.cell(line, 'M')
      w.save!
    end
    puts "#{i} Record inserted.-----------------------------------------------"
    i += 1
  end
end
end