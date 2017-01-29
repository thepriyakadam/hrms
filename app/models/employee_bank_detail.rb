class EmployeeBankDetail < ActiveRecord::Base
  belongs_to :employee
  has_many :salaryslips
  has_many :employee_bank_details
  belongs_to :bank
  # validates :bank_name, :presence => true
  # validates :branch_name, :presence => true
  # validates :address, :presence => true
  # validates :branch_code, :presence => true
  # validate :bank_name_regex
  # validate :branch_name_regex
  # validate :contact_no_regex
  # validate :ifsc_regex
  # validate :branch_code_regex
  # validate :micr_code_regex
  # validate :account_no_regex
  
def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |employee_bank_detail|
        csv << employee_bank_detail.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      employee_bank_detail = find_by_id(row["id"]) || new
      employee_bank_detail.attributes = row.to_hash.slice(*row.to_hash.keys)
      employee_bank_detail.save!
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

  def bank_name_regex
    if bank_name.present? && !bank_name.match(/\A[A-Za-z_ ]{1,30}\Z/)
      errors.add :bank_name, 'Bank Name allows only Characters'
    end
  end

  def branch_name_regex
    if branch_name.present? && !branch_name.match(/\A[A-Za-z_ ]{1,30}\Z/)
      errors.add :branch_name, 'Branch Name allows only Characters'
    end
  end

  def branch_code_regex
    if branch_code.present? && !branch_code.match(/\A[0-9]{1,6}\Z/)
      errors.add :branch_code, 'Branch Code allows only Digits Eg:123456'
    end
  end

  def micr_code_regex
    if micr_code.present? && !micr_code.match(/\A[0-9]{1,9}\Z/)
      errors.add :micr_code, 'MICR Code allows only Digits Eg:123456789'
    end
  end

  def contact_no_regex
    if contact_no.present? && !contact_no.match(/^((\+)?[1-9]{1,2})?([-\s\.])?((\(\d{1,4}\))|\d{1,4})(([-\s\.])?[0-9]{1,12}){1,2}$/)
      errors.add :contact_no, 'Please Enter correct Contact No'
    end
    end

  def ifsc_regex
    if ifsc_code.present? && !ifsc_code.match(/^([A-Z]{4})(\d{7})$/)
      errors.add :ifsc_code, 'Please specify Correct IFSC Code Eg:ABHY1234567'
    end
  end

  def account_no_regex
    if account_no.present? && !account_no.match(/\A[0-9]{1,15}\Z/)
      errors.add :account_no, 'Account NO Allows Only Digits allows only Digits'
    end
  end

  def self.add_bank
    ba = [nil, "", "AXIS BANK", "CHEQUE", "HDFC", "NARMADA GRAMIN ", "S .B.I.", "SBI", "SBM", "STATE BANK OF INDIA", "State Bank of ondia", "UNION BANK", "sbi"]
    EmployeeBankDetail.all.each do |b|
      case b.bank_name
        when nil
          b.update(bank_id: nil)
        when ""
          b.update(bank_id: nil)
        when "AXIS BANK"
          b.update(bank_id: 2)
        when "CHEQUE"
          b.update(bank_id: nil)
        when "HDFC"
          b.update(bank_id: 4)
        when "NARMADA GRAMIN "
          b.update(bank_id: 5)
        when "S .B.I."
          b.update(bank_id: 1)
        when "SBM"
          b.update(bank_id: 3)
        when "STATE BANK OF INDIA"
          b.update(bank_id: 1)
        when "State Bank of ondia"
          b.update(bank_id: 1)
        when "UNION BANK"
          b.update(bank_id: 6)
        when "sbi"
          b.update(bank_id: 1)
      end # case end  
    end # bank_loop
  end # action end
end # class end
