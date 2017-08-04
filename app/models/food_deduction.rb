class FoodDeduction < ActiveRecord::Base
  belongs_to :employee
  belongs_to :food_coupan_master

  validates :employee_id, presence: true
  validates :food_date, presence: true
  validates :no_of_coupan, presence: true
  validates :food_coupan_master_id, presence: true

def self.import_deduction_file(file)
  spreadsheet = open_spreadsheet(file)
    (2..spreadsheet.last_row).each do |i|

        @employee = Employee.find_by_manual_employee_code(spreadsheet.cell(i,'A').to_i)
        employee_id = @employee.id
        food_date = spreadsheet.cell(i,'B')
        no_of_coupan = spreadsheet.cell(i,'C')
        @food_coupan_master = FoodCoupanMaster.find_by_name(spreadsheet.cell(i,'D'))
        food_coupan_master_id = @food_coupan_master.id
     
        @food_deduction = FoodDeduction.create(employee_id: employee_id,food_date: food_date,no_of_coupan: no_of_coupan,food_coupan_master_id: food_coupan_master_id)
    end
	# spreadsheet = open_spreadsheet(file)
	# header = spreadsheet.row(1)
 #  	(2..spreadsheet.last_row).each do |i|

 #  	  row = Hash[[header, spreadsheet.row(i)].transpose]
 #  	  food_deduction = find_by_id(row['id']) || new
 #  	  food_deduction.attributes = row.to_hash.slice(*row.to_hash.keys)
 #  	  food_deduction.save!
 #  	end
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
