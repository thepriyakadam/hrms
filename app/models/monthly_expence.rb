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
      manual_employee_code = spreadsheet.cell(i,'B').to_i
        if manual_employee_code == 0
           manual_employee_code = spreadsheet.cell(i,'B')
           @employee = Employee.find_by_manual_employee_code(spreadsheet.cell(i,'B'))
        else
           manual_employee_code = spreadsheet.cell(i,'B').to_i
           @employee = Employee.find_by_manual_employee_code(spreadsheet.cell(i,'B').to_i)
        end

      #@employee = Employee.find_by_manual_employee_code(spreadsheet.cell(i,'B').to_i)
      if @employee.nil?
      else
        employee_id = @employee.id
        @expencess_type = ExpencessType.find_by_name(spreadsheet.cell(i,'C'))
        if @expencess_type == nil
          expencess_type_name = spreadsheet.cell(i,'C')
           @expencess_type_entry = ExpencessType.create(name: expencess_type_name)
           expencess_type_id = @expencess_type_entry.id
        else
          expencess_type_id = @expencess_type.id
        end
          amount = spreadsheet.cell(i,'D')
          expence_date = spreadsheet.cell(i,'E')
          description = spreadsheet.cell(i, 'F') 
          @monthly_expence_check = MonthlyExpence.where(employee_id: employee_id,expence_date: expence_date.to_date,expencess_type_id: expencess_type_id).take
        
        if @monthly_expence_check.nil?
          @monthly_expence = MonthlyExpence.create(:employee_id => employee_id, :expencess_type_id => expencess_type_id,:amount => amount,:expence_date => expence_date.to_date, :description => description)
        else
          @monthly_expence_check.update(employee_id: employee_id,expencess_type_id: expencess_type_id,amount: amount,expence_date: expence_date.to_date,description: description)
        end
      end#@employee.nil?
    end#do

    # spreadsheet = open_spreadsheet(file)
    # header = spreadsheet.row(1)
    # (2..spreadsheet.last_row).each do |i|
    #   row = Hash[[header, spreadsheet.row(i)].transpose]
    #   monthly_expence = find_by_id(row['id']) || new
    #   monthly_expence.attributes = row.to_hash.slice(*row.to_hash.keys)
    #   monthly_expence.save!
    # end
  end#def

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when '.csv' then Roo::CSV.new(file.path, file_warning: :ignore)
    when '.xls' then Roo::Excel.new(file.path, file_warning: :ignore)
    when '.xlsx' then Roo::Excelx.new(file.path, file_warning: :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

end
