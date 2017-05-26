class Family < ActiveRecord::Base
  belongs_to :employee
  belongs_to :blood_group
  belongs_to :religion

  has_many :employee_nominations

  validates :relation, presence: true
  validates :f_name, presence: true
  validates :l_name, presence: true

  validate :adhar_no_regex
  validate :pan_no_regex


  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |family|
        csv << family.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      family = find_by_id(row["id"]) || new
      family.attributes = row.to_hash.slice(*row.to_hash.keys)
      family.save!
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

  def adhar_no_regex
    if adhar_no.present? && !adhar_no.match(/[0-9]{12}/)
      errors.add :adhar_no, 'Please specify Correct Adhar Number'
    end
  end

  def pan_no_regex
    if pan_no.present? && !pan_no.match(/^([A-Z]{5})(\d{4})([A-Z]{1})$/)
      errors.add :pan_no, 'Please specify Correct Pan Card Number eg:ABCDE1234A'
    end
   end

  def email_regex
    if email.present? && !email.match(/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.(com|net|org|info|com.au|))?$/)
      errors.add :email, 'This is not a valid email format'
    end
  end
end
