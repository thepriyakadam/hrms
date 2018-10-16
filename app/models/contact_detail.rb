class ContactDetail < ActiveRecord::Base
  belongs_to :employee


 def self.import(file)
  spreadsheet = open_spreadsheet(file)
    (2..spreadsheet.last_row).each do |i|
        manual_employee_code = spreadsheet.cell(i,'B').to_i
        if manual_employee_code == 0
           manual_employee_code = spreadsheet.cell(i,'B')
           @employee = Employee.find_by_manual_employee_code(spreadsheet.cell(i,'B'))
        else
           manual_employee_code = spreadsheet.cell(i,'B').to_i
           @employee = Employee.find_by_manual_employee_code(spreadsheet.cell(i,'B').to_i)
        end

        #@employee = Employee.find_by_manual_employee_code(spreadsheet.cell(i,'B').to_i)
        if @employee == nil
        else

        employee_id = @employee.id
        name = spreadsheet.cell(i,'C')
        role1 = spreadsheet.cell(i,'D')
        role2 = spreadsheet.cell(i,'E')
        role3 = spreadsheet.cell(i,'F')
        role4 = spreadsheet.cell(i,'G')
        role5 = spreadsheet.cell(i,'H')
        role6 = spreadsheet.cell(i,'I')
        role7 = spreadsheet.cell(i,'J')
        role8 = spreadsheet.cell(i,'K')
        description = spreadsheet.cell(i,'L')
        status = spreadsheet.cell(i,'M')
        if status == "Yes" || status == "yes"
          status = true
        else
          status = false
        end

        @contact_detail = ContactDetail.create(employee_id: employee_id,name: name,role1: role1,role2: role2,role3: role3, role4: role4,role5: role5,role6: role6,role7: role7,role8: role8,description: description,status: status)
    end

  end
end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path, file_warning: :ignore)
      when ".xls" then Roo::Excel.new(file.path, file_warning: :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, file_warning: :ignore)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end

end
