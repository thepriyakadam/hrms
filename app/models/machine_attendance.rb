class MachineAttendance < ActiveRecord::Base
  belongs_to :employee
  belongs_to :shift_master
  has_many :employee_attendances
  validates :shift_master_id, presence: true
  validates :employee_id, uniqueness: { scope: [:day] }

  has_many :subordinates, class_name: 'MachineAttendance',
                          foreign_key: 'user_id'
  belongs_to :user, class_name: 'Employee'

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |machine_attendance|
        csv << machine_attendance.attributes.values_at(*column_names)
      end
    end
  end

  def self.to_txt(options = {})
    TEXT.generate(options) do |txt|
      txt << column_names
      all.each do |machine_attendance|
        txt << machine_attendance.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      machine_attendance = find_by_id(row['id']) || new
      machine_attendance.attributes = row.to_hash.slice(*row.to_hash.keys)
      machine_attendance.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when '.csv' then Roo::CSV.new(file.path, file_warning: :ignore)
    when '.xls' then Roo::Excel.new(file.path, file_warning: :ignore)
    when '.xlsx' then Roo::Excelx.new(file.path, file_warning: :ignore)
    when '.txt' then Roo::TEXT.new(file.path, file_warning: :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

end
