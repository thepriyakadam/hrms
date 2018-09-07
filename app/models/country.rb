class Country < ActiveRecord::Base
  has_many :states
  has_many :companies
  has_many :company_locations
  has_many :employees
  has_many :families
  has_many :capture_resumes
  has_many :employee_nominations
  has_many :pre_onboardings
  # validates :code, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  def self.import(file)
     spreadsheet = open_spreadsheet(file)
     (2..spreadsheet.last_row).each do |i|
        
        code = spreadsheet.cell(i,'B').to_i
        if code == 0
           code = spreadsheet.cell(i,'B')
        else
          code = spreadsheet.cell(i,'B').to_i
        end
        name = spreadsheet.cell(i,'C')
        
        @country = Country.find_by(name: name)
        if @country.nil?
          @country = Country.create(code: code,name: name)     
        else
          @country.update(code: code,name: name)
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

  def self.filter_records(current_user)
    @countries =  if current_user.class == Group
    Country.all
    elsif current_user.class == Member
      if current_user.role.name == "GroupAdmin"
      Country.all
      elsif current_user.role.name == "Admin"
      Country.all
      elsif current_user.role.name == "Branch"
      Country.all
      end
    end
  end
end
