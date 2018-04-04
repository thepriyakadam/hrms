class EmployeeNomination < ActiveRecord::Base
  belongs_to :nomination_master
  belongs_to :family
  belongs_to :relation
  belongs_to :district
  belongs_to :state
  belongs_to :country
  belongs_to :employee
  belongs_to :relation_master
  belongs_to :illness_type


  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |employee_nomination|
        csv << employee_nomination.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      employee_nomination = find_by_id(row["id"]) || new
      employee_nomination.attributes = row.to_hash.slice(*row.to_hash.keys)
      employee_nomination.save!
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

  def nomination_sum(nomination_master,employee_nomination,employee)
  	previous_nomination = nomination_master.employee_nominations.sum(:nomination)
  	previous_nomination + employee_nomination.nomination
  end
end
