class JoiningDetail < ActiveRecord::Base
  belongs_to :employee
  belongs_to :employee_grade
  belongs_to :employee_designation
  belongs_to :cost_center
  belongs_to :employee_category
  belongs_to :payment_mode
  belongs_to :department
  belongs_to :company_location
  belongs_to :reserved_category

  validates :employee_id, presence: true, uniqueness: { case_sensitive: false }
  belongs_to :replacement, class_name: 'Employee'
  # validates :joining_date, presence: true
  # validates :employee_designation_id, presence: true
  # validate :medical_scheme_regex
  # validate :probation_period_regex
  # validate :notice_period_regex
  # validate :status_regex


def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |joining_detail|
        csv << joining_detail.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      joining_detail = find_by_id(row["id"]) || new
      joining_detail.attributes = row.to_hash.slice(*row.to_hash.keys)
      joining_detail.save!
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
  def probation_period_regex
    if probation_period.present? && !probation_period.match(/\A[0-9A-Za-z_ ]{1,30}\Z/)
      errors.add :probation_period, 'Please Enter Probation Period In Days or Months'
    end
  end

  def notice_period_regex
    if notice_period.present? && !notice_period.match(/\A[0-9A-Za-z_ ]{1,30}\Z/)
      errors.add :notice_period, 'Please Enter Notice Period In Days or Months'
    end
    end

  def medical_scheme_regex
    if medical_schem.present? && !medical_schem.match(/\A[A-Za-z_ ]{1,30}\Z/)
      errors.add :medical_schem, 'Medical Scheme Allows only Characters'
    end
    end

  def status_regex
    if status.present? && !status.match(/\A[A-Za-z_ ]{1,30}\Z/)
      errors.add :status, 'Status Allows only Characters'
    end
  end
end