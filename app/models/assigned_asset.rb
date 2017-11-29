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
    (2..spreadsheet.last_row).each do |i|
        @employee = Employee.find_by_manual_employee_code(spreadsheet.cell(i,'B').to_i)
        employee_id = @employee.id
        @asset_type = AssetType.find_by_name(spreadsheet.cell(i,'C'))
        if @asset_type == nil
           asset_type_name = spreadsheet.cell(i,'C')
           @asset_type_entry = AssetType.create(name: asset_type_name)
           asset_type_id = @asset_type_entry.id
        else
        asset_type_id = @asset_type.id
        end
        assets_detail = spreadsheet.cell(i,'D')
        assets_id = spreadsheet.cell(i,'E')
        assets_value = spreadsheet.cell(i,'F')
        assest_status = spreadsheet.cell(i,'G')
        issue_date = spreadsheet.cell(i,'H')
        remarks = spreadsheet.cell(i,'I')

        @assigned_asset = AssignedAsset.create(employee_id: employee_id,asset_type_id: asset_type_id,assets_detail: assets_detail,assets_id: assets_id,assets_value: assets_value,
          assest_status: assest_status,issue_date: issue_date,remarks: remarks)
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
