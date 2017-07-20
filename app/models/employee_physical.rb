class EmployeePhysical < ActiveRecord::Base
  belongs_to :employee

  validates :height, presence: true
  validates :weight, presence: true
  validates :size, presence: true
  validates :trouser_size, presence: true

   def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |employee_physical|
        csv << employee_physical.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      employee_physical = find_by_id(row["id"]) || new
      employee_physical.attributes = row.to_hash.slice(*row.to_hash.keys)
      employee_physical.save!
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
