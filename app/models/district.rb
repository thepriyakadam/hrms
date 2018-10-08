class District < ActiveRecord::Base
  belongs_to :state
  has_many :companies
  has_many :company_locations
  has_many :employees
  has_many :families
  has_many :capture_resumes
  has_many :employee_nominations
  has_many :pre_onboardings
  # validates :name, presence: true, uniqueness: { case_sensitive: false }

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    (2..spreadsheet.last_row).each do |i|
      state = spreadsheet.cell(i,'B')
      @state = State.find_by(name: state)
      if @state.nil?
      else
        state = spreadsheet.cell(i,'B')

        code = spreadsheet.cell(i,'C').to_i
        if code == 0
           code = spreadsheet.cell(i,'C')
        else
          code = spreadsheet.cell(i,'C').to_i
        end
        district = spreadsheet.cell(i,'D')
        
        @district = District.find_by(name: district)
        if @district.nil?
          @district = District.create(state_id: @state.id,code: code,name: district)     
        else
          @district.update(state_id: @state.id,code: code,name: district)
        end
      end#if @country.nil?
    end#do
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
    @disticts =  if current_user.class == Group
    District.all
    elsif current_user.class == Member
    if current_user.role.name == "GroupAdmin"
    District.all
  elsif current_user.role.name == "Admin"
    District.all
    elsif current_user.role.name == "Branch"
    District.all
    end
  end
  end
end
