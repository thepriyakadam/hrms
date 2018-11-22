class Family < ActiveRecord::Base
  belongs_to :employee
  belongs_to :blood_group
  belongs_to :religion
  belongs_to :relation_master

  has_many :employee_nominations


  validates :f_name, presence: true
  # validates :l_name, presence: true

  # validate :adhar_no_regex
  # validate :pan_no_regex


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
    (2..spreadsheet.last_row).each do |i|
      manual_employee_code = spreadsheet.cell(i,'B').to_i
      if manual_employee_code == 0
         manual_employee_code = spreadsheet.cell(i,'B')
         @employee = Employee.find_by_manual_employee_code(spreadsheet.cell(i,'B'))
      else
         manual_employee_code = spreadsheet.cell(i,'B').to_i
         @employee = Employee.find_by_manual_employee_code(spreadsheet.cell(i,'B').to_i)
      end

      #@employee = Employee.find_by_manual_employee_code(spreadsheet.cell(i,'B').to_i)
      if @employee == nil
      else

        employee_id = @employee.id
        @relation_master = RelationMaster.find_by_name(spreadsheet.cell(i,'C'))
        if @relation_master == nil
           relation_master_name = spreadsheet.cell(i,'C')
           @relation_master_entry = RelationMaster.create(name: relation_master_name)
           relation_master_id = @relation_master_entry.id
        else
        relation_master_id = @relation_master.id
        end
        f_name = spreadsheet.cell(i,'D')
        m_name = spreadsheet.cell(i,'E')
        l_name = spreadsheet.cell(i,'F')
        date_of_birth = spreadsheet.cell(i,'G')
        age = spreadsheet.cell(i,'H')
        contact_no = spreadsheet.cell(i,'I').to_i
        email = spreadsheet.cell(i,'J')
        current_address = spreadsheet.cell(i,'K')
        gender = spreadsheet.cell(i,'L')
        @blood_group = BloodGroup.find_by_name(spreadsheet.cell(i,'M'))
        if @blood_group == nil
           blood_group_name = spreadsheet.cell(i,'M')
           @blood_group_entry = BloodGroup.create(name: blood_group_name)
           blood_group_id = @blood_group_entry.id
        else
        blood_group_id = @blood_group.id
        end
        adhar_no = spreadsheet.cell(i,'N').to_i
        pan_no = spreadsheet.cell(i,'O')
        marital = spreadsheet.cell(i,'P')
        medical_claim = spreadsheet.cell(i,'Q')
        profession = spreadsheet.cell(i,'R')
        passport_no = spreadsheet.cell(i,'S')
        passport_issue_date = spreadsheet.cell(i,'T')
        passport_expiry_date = spreadsheet.cell(i,'U')
        @religion = Religion.find_by_name(spreadsheet.cell(i,'V'))
        if @religion == nil
           religion_name = spreadsheet.cell(i,'V')
           @religion_entry = Religion.create(name: religion_name)
           religion_id = @religion_entry.id
        else
        religion_id = @religion.id
        end        
        is_handicap = spreadsheet.cell(i,'W')
        handicap_type = spreadsheet.cell(i,'X')

        @family = Family.where(employee_id: employee_id,relation_master_id: relation_master_id,f_name: f_name).take
        if @family.nil?
          @family = Family.create(employee_id: employee_id,relation_master_id: relation_master_id,f_name: f_name,m_name: m_name,l_name: l_name,
          date_of_birth: date_of_birth,age: age,contact_no: contact_no,email: email,current_address: current_address,gender: gender,blood_group_id: blood_group_id,
          adhar_no: adhar_no,pan_no: pan_no,marital: marital,medical_claim: medical_claim,profession: profession,passport_no: passport_no,passport_issue_date: passport_issue_date,
          passport_expiry_date: passport_expiry_date,religion_id: religion_id,is_handicap: is_handicap,handicap_type: handicap_type)
        else
          @family.udate(employee_id: employee_id,relation_master_id: relation_master_id,f_name: f_name,m_name: m_name,l_name: l_name,
          date_of_birth: date_of_birth,age: age,contact_no: contact_no,email: email,current_address: current_address,gender: gender,blood_group_id: blood_group_id,
          adhar_no: adhar_no,pan_no: pan_no,marital: marital,medical_claim: medical_claim,profession: profession,passport_no: passport_no,passport_issue_date: passport_issue_date,
          passport_expiry_date: passport_expiry_date,religion_id: religion_id,is_handicap: is_handicap,handicap_type: handicap_type)
        end  
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
