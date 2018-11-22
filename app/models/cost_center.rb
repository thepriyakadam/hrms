class CostCenter < ActiveRecord::Base
  has_many :joining_details
  has_many :slip_informations
  has_many :vacancy_masters
  has_many :employees
  has_many :shift_times

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  def self.import(file)
   	spreadsheet = open_spreadsheet(file)
    (2..spreadsheet.last_row).each do |i|
      
      code = spreadsheet.cell(i,'B')
      name = spreadsheet.cell(i,'C')
      description = spreadsheet.cell(i,'D')
      confirm = spreadsheet.cell(i,'E')

      if confirm == "Yes" || confirm == "yes"
      	confirm = true
      else
      	confirm = false
      end

      if code == nil || name == nil
      else
        @cost_center = CostCenter.find_by(name: name)
        if @cost_center.nil?
          @cost_center = CostCenter.create(code: code,name: name,description: description,is_confirm: confirm)     
        else
          @cost_center.update(code: code,name: name,description: description,is_confirm: confirm)
        end
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
