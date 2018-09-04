class ExpenceOpestion < ActiveRecord::Base
  belongs_to :employee_grade
  has_many :modes
  has_many :expenses_masters
  has_many :billing_options
  has_many :daily_bill_details

  #validates :employee_grade_id
  #validates :name, presence: true, uniqueness: { case_sensitive: false }

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    (2..spreadsheet.last_row).each do |i|
        expence_opestion_id = spreadsheet.cell(i,'B').to_i
        code = spreadsheet.cell(i,'C')
        if code == 0
          code = spreadsheet.cell(i,'C')
        else
          code = spreadsheet.cell(i,'C')
        end
        name = spreadsheet.cell(i,'D')
        description = spreadsheet.cell(i,'E')
       	status = spreadsheet.cell(i,'F')

       	@expence_opestions = ExpenceOpestion.find_by(name: name)
        if @expence_opestions == nil
        	@expence_opestions_new = ExpenceOpestion.create(expence_opestion_id: expence_opestion_id, code: code,name: name, description: description, status: status)
        else 
        	@expence_opestions.update(expence_opestion_id: expence_opestion_id, code: code,name: name, description: description, status: status)
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