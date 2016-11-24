class AssignedAsset < ActiveRecord::Base
  belongs_to :employee
  belongs_to :asset_type

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |assigned_asset|
        csv << assigned_asset.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      assigned_asset = find_by_id(row["id"]) || new
      assigned_asset.attributes = row.to_hash.slice(*row.to_hash.keys)
      assigned_asset.save!
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
