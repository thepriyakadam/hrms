class DailyAttendance < ActiveRecord::Base

  def self.import(file)
	spreadsheet = open_spreadsheet(file)
	header = spreadsheet.row(1)
	(2..spreadsheet.last_row).each do |i|
	  row = Hash[[header, spreadsheet.row(i)].transpose]
	  employee_attendance = find_by_id(row['id']) || new
    
	  employee_attendance.attributes = row.to_hash.slice(*row.to_hash.keys)
	  employee_attendance.save!
	end
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
