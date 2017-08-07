class MonthlyExpence < ActiveRecord::Base
  belongs_to :employee
  belongs_to :expencess_type
  attr_accessor :total_amount

  validates :employee_id, presence: true
  validates :expencess_type_id, presence: true
  validates :expence_date, presence: true
  validates :amount, presence: true

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    (2..spreadsheet.last_row).each do |i|

        @employee = Employee.find_by_manual_employee_code(spreadsheet.cell(i,'A').to_i)
        employee_id = @employee.id
        @expence = ExpencessType.find_by_name(spreadsheet.cell(i,'B'))
        expencess_type_id = @expence.id
        amount = spreadsheet.cell(i,'C')
        expence_date = spreadsheet.cell(i,'D')
   
        @monthly_expence = MonthlyExpence.create(:employee_id => employee_id, :expencess_type_id => expencess_type_id,:amount => amount,:expence_date => expence_date)
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
