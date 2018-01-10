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
    (2..spreadsheet.last_row).each do |i|
        @employee = Employee.find_by_manual_employee_code(spreadsheet.cell(i,'B').to_i)
        if @employee.nil?
        else
        employee_id = @employee.id
        employee_uan_no = spreadsheet.cell(i,'C')
        employee_pf_no = spreadsheet.cell(i,'D')
        joining_date = spreadsheet.cell(i,'E')
        confirmation_date = spreadsheet.cell(i,'F')
        @employee_grade = EmployeeGrade.find_by_name(spreadsheet.cell(i,'G'))
        if @employee_grade == nil
           employee_grade_name = spreadsheet.cell(i,'G')
           @employee_grade_entry = EmployeeGrade.create(name: employee_grade_name)
           employee_grade_id = @employee_grade_entry.id
        else
        employee_grade_id = @employee_grade.id
        end
        @employee_designation = EmployeeDesignation.find_by_name(spreadsheet.cell(i,'H'))
        if @employee_designation == nil
           employee_designation_name = spreadsheet.cell(i,'H')
           @employee_designation_entry = EmployeeDesignation.create(name: employee_designation_name)
           employee_designation_id = @employee_designation_entry.id
        else
        employee_designation_id = @employee_designation.id
        end
        @employee_category = EmployeeCategory.find_by_name(spreadsheet.cell(i,'I'))
        if @employee_category == nil
           employee_category_name = spreadsheet.cell(i,'I')
           @employee_category_entry = EmployeeCategory.create(name: employee_category_name)
           employee_category_id = @employee_category_entry.id
        else
        employee_category_id = @employee_category.id
        end
        probation_period = spreadsheet.cell(i,'J')
        notice_period = spreadsheet.cell(i,'K')
        # notice_period_after_probation = spreadsheet.cell(i,'L')
        have_passport = spreadsheet.cell(i,'M')
        passport_no = spreadsheet.cell(i,'N')
        passport_issue_date = spreadsheet.cell(i,'O')
        passport_expiry_date = spreadsheet.cell(i,'P')
        leaving_date = spreadsheet.cell(i,'Q')
        retirement_date = spreadsheet.cell(i,'R')
         c_off = spreadsheet.cell(i,'S')
         if c_off == "Yes"
           c_off = true
         else
           c_off = false
         end
        @payment_mode = PaymentMode.find_by_name(spreadsheet.cell(i,'T'))
        if @payment_mode == nil
           payment_mode_name = spreadsheet.cell(i,'T')
           @payment_mode_entry = PaymentMode.create(name: payment_mode_name)
           payment_mode_id = @payment_mode_entry.id
        else
        payment_mode_id = @payment_mode.id
        end
        basis_of_time = spreadsheet.cell(i,'U')
        if basis_of_time == "Yes"
          basis_of_time = true
        else
          basis_of_time = false
        end
        is_employeer_pf = spreadsheet.cell(i,'V')
        if is_employeer_pf == "Yes"
          is_employeer_pf = true
        else
          is_employeer_pf = false
        end
        select_pf = spreadsheet.cell(i,'W')
        pf_max_amount = spreadsheet.cell(i,'X')
        employee_pf_no = spreadsheet.cell(i,'Y')
        is_employeer_esic = spreadsheet.cell(i,'Z')
        if is_employeer_esic == "Yes"
          is_employeer_esic = true
        else
          is_employeer_esic = false
        end
        have_esic = spreadsheet.cell(i,'AA')
        if have_esic == "Yes"
          have_esic = true
        else
          have_esic = false
        end
        employee_efic_no = spreadsheet.cell(i,'AB')
        have_retention = spreadsheet.cell(i,'AC')
        if have_retention == "Yes"
          have_retention = true
        else
          have_retention = false
        end
        is_insurance = spreadsheet.cell(i,'AD')
        if is_insurance == "Yes"
          is_insurance = true
        else
          is_insurance = false
        end
        is_family_pension = spreadsheet.cell(i,'AE')
        if is_family_pension == "Yes"
          is_family_pension = true
        else
          is_family_pension = false
        end
        is_bonus = spreadsheet.cell(i,'AF')
        if is_bonus == "Yes"
          is_bonus = true
        else
          is_bonus = false
        end
        ot_option = spreadsheet.cell(i,'AG')
        if ot_option == "Yes"
          ot_option = true
        else
          ot_option = false
        end
        ot_rate = spreadsheet.cell(i,'AH')

        @cost_center = CostCenter.find_by_name(spreadsheet.cell(i,'AI'))
        if @cost_center == nil
           cost_center_name = spreadsheet.cell(i,'AI')
           @cost_center_entry = CostCenter.create(name: cost_center_name)
           cost_center_id = @cost_center_entry.id
        else
        cost_center_id = @cost_center.id
        end
        
        @employee_prsent = JoiningDetail.find_by(employee_id: employee_id)
        if @employee_prsent.nil?
        @joining_detail = JoiningDetail.create(employee_id: employee_id,employee_uan_no: employee_uan_no,employee_pf_no: employee_pf_no,joining_date: joining_date,confirmation_date: confirmation_date,employee_grade_id: employee_grade_id,employee_designation_id: employee_designation_id,employee_category_id: employee_category_id,probation_period: probation_period,
        notice_period: notice_period,have_passport: have_passport,passport_no: passport_no,passport_issue_date: passport_issue_date,passport_expiry_date: passport_expiry_date,leaving_date: leaving_date,payment_mode_id: payment_mode_id,basis_of_time: basis_of_time,is_employeer_pf: is_employeer_pf,select_pf: select_pf,pf_max_amount: pf_max_amount,employee_pf_no: employee_pf_no,
        is_employeer_esic: is_employeer_esic,have_esic: have_esic,employee_efic_no: employee_efic_no,have_retention: have_retention,is_insurance: is_insurance,is_family_pension: is_family_pension,is_bonus: is_bonus,ot_option: ot_option,ot_rate: ot_rate,cost_center_id: cost_center_id)
        else
        @employee_prsent.update(employee_id: employee_id,employee_uan_no: employee_uan_no,c_off: c_off,employee_pf_no: employee_pf_no,joining_date: joining_date,confirmation_date: confirmation_date,employee_grade_id: employee_grade_id,employee_designation_id: employee_designation_id,employee_category_id: employee_category_id,probation_period: probation_period,
        notice_period: notice_period,have_passport: have_passport,passport_no: passport_no,passport_issue_date: passport_issue_date,passport_expiry_date: passport_expiry_date,leaving_date: leaving_date,payment_mode_id: payment_mode_id,basis_of_time: basis_of_time,is_employeer_pf: is_employeer_pf,select_pf: select_pf,pf_max_amount: pf_max_amount,employee_pf_no: employee_pf_no,
        is_employeer_esic: is_employeer_esic,have_esic: have_esic,employee_efic_no: employee_efic_no,have_retention: have_retention,is_insurance: is_insurance,is_family_pension: is_family_pension,is_bonus: is_bonus,ot_option: ot_option,ot_rate: ot_rate,cost_center_id: cost_center_id)
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
