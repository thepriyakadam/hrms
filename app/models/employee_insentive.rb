class EmployeeInsentive < ActiveRecord::Base
  belongs_to :employee

  validates :employee_id, presence: true
  validates :date, presence: true
  validates :amount, presence: true


  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    (2..spreadsheet.last_row).each do |i|
        @employee = Employee.find_by_manual_employee_code(spreadsheet.cell(i,'B').to_i)
        if @employee.nil?
        else
        	employee_id = @employee.id
        	amount = spreadsheet.cell(i,'C')
	        date = spreadsheet.cell(i,'D')
	        description = spreadsheet.cell(i, 'E')   
	        @monthly_expence = EmployeeInsentive.create(:employee_id => employee_id, :amount => amount,:date => date, :description => description)
      	end
    end
    # spreadsheet = open_spreadsheet(file)
    # header = spreadsheet.row(1)
    # (2..spreadsheet.last_row).each do |i|
    #   row = Hash[[header, spreadsheet.row(i)].transpose]
    #   monthly_expence = find_by_id(row['id']) || new
    #   monthly_expence.attributes = row.to_hash.slice(*row.to_hash.keys)
    #   monthly_expence.save!
    # end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when '.csv' then Roo::CSV.new(file.path, file_warning: :ignore)
    when '.xls' then Roo::Excel.new(file.path, file_warning: :ignore)
    when '.xlsx' then Roo::Excelx.new(file.path, file_warning: :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
  
end
