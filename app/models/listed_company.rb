class ListedCompany < ActiveRecord::Base
	belongs_to :employee_plan

	def self.import(file)
    spreadsheet = open_spreadsheet(file)
    (2..spreadsheet.last_row).each do |i|
        
      company_name = spreadsheet.cell(i,'B')
        contact_no = spreadsheet.cell(i,'C')
        email = spreadsheet.cell(i,'D')
        location = spreadsheet.cell(i,'E')
        status = spreadsheet.cell(i,'F')
        code = spreadsheet.cell(i,'G')
        optinal_contact_no = spreadsheet.cell(i,'H')
      if company_name.nil? || email.nil?
      else
        if status == "Yes" || status == "Active"
          status = true
        else
          status = false
        end

        @listed_company = ListedCompany.find_by(name: company_name)
        if @listed_company.nil?
        @listed_companies = ListedCompany.create(name: company_name,contact_no: contact_no,email: email,location: location,status: status, code: code, optinal_contact_no: optinal_contact_no)
        else
          @listed_company.update(name: company_name,contact_no: contact_no,email: email,location: location,status: status, code: code, optinal_contact_no: optinal_contact_no)
        end
      end#company_name.nil?
    end#do
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
