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
        manual_employee_code = spreadsheet.cell(i,'B').to_i
        if manual_employee_code == 0
           manual_employee_code = spreadsheet.cell(i,'B')
           @employee = Employee.find_by_manual_employee_code(spreadsheet.cell(i,'B'))
        else
           manual_employee_code = spreadsheet.cell(i,'B').to_i
           @employee = Employee.find_by_manual_employee_code(spreadsheet.cell(i,'B').to_i)
        end

        #@employee = Employee.find_by_manual_employee_code(spreadsheet.cell(i,'B').to_i)
        if @employee.nil?
        else
        employee_id = @employee.id
        employee_uan_no = spreadsheet.cell(i,'C').to_i
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

        contract_month_value = spreadsheet.cell(i,'J')
        contract_month = contract_month_value.to_i

        contract_end_date = spreadsheet.cell(i,'K')
        if !contract_month.nil? or !contract_month == nil or !contract_month == ""
          contract_end_date = joining_date.to_date + contract_month.months
        else
          contract_end_date = spreadsheet.cell(i,'K')
        end
        probation_period = spreadsheet.cell(i,'L')
        notice_period = spreadsheet.cell(i,'M')
         notice_period_after_probation = spreadsheet.cell(i,'N')
        have_passport = spreadsheet.cell(i,'O')
        passport_no = spreadsheet.cell(i,'P')
        passport_issue_date = spreadsheet.cell(i,'Q')
        passport_expiry_date = spreadsheet.cell(i,'R')
        leaving_date = spreadsheet.cell(i,'S')
        retirement_date = spreadsheet.cell(i,'T')
        if retirement_date.nil?
         if !@employee.date_of_birth.nil?
          employee = Employee.find_by(id: employee_id)
          @date_of_birth = employee.date_of_birth
          retirement_date = @date_of_birth.to_date + 58.years
          else
            retirement_date = spreadsheet.cell(i,'T')
          end
         else
          retirement_date = spreadsheet.cell(i,'T')
        end
        c_off = spreadsheet.cell(i,'U')
        if c_off == "Yes"
          c_off = true
        else
          c_off = false
        end
        @payment_mode = PaymentMode.find_by_name(spreadsheet.cell(i,'V'))
        if @payment_mode == nil
           payment_mode_name = spreadsheet.cell(i,'V')
           @payment_mode_entry = PaymentMode.create(name: payment_mode_name)
           payment_mode_id = @payment_mode_entry.id
        else
        payment_mode_id = @payment_mode.id
        end
        basis_of_time = spreadsheet.cell(i,'W')
        if basis_of_time == "Yes"
          basis_of_time = true
        else
          basis_of_time = false
        end
        is_employeer_pf = spreadsheet.cell(i,'X')
        if is_employeer_pf == "Yes"
          is_employeer_pf = true
        else
          is_employeer_pf = false
        end
        select_pf = spreadsheet.cell(i,'Y')
        pf_max_amount = spreadsheet.cell(i,'Z')
        employee_pf_no = spreadsheet.cell(i,'AA')
        is_employeer_esic = spreadsheet.cell(i,'AB')
        if is_employeer_esic == "Yes"
          is_employeer_esic = true
        else
          is_employeer_esic = false
        end
        have_esic = spreadsheet.cell(i,'AC')
        if have_esic == "Yes"
          have_esic = true
        else
          have_esic = false
        end
        employee_efic_no = spreadsheet.cell(i,'AD')
        have_retention = spreadsheet.cell(i,'AE')
        if have_retention == "Yes"
          have_retention = true
        else
          have_retention = false
        end
        is_insurance = spreadsheet.cell(i,'AF')
        if is_insurance == "Yes"
          is_insurance = true
        else
          is_insurance = false
        end
        is_family_pension = spreadsheet.cell(i,'AG')
        if is_family_pension == "Yes"
          is_family_pension = true
        else
          is_family_pension = false
        end
        is_bonus = spreadsheet.cell(i,'AH')
        if is_bonus == "Yes"
          is_bonus = true
        else
          is_bonus = false
        end
        ot_option = spreadsheet.cell(i,'AI')
        if ot_option == "Yes"
          ot_option = true
        else
          ot_option = false
        end
        ot_rate = spreadsheet.cell(i,'AJ')

        @cost_center = CostCenter.find_by_name(spreadsheet.cell(i,'AK'))
        if @cost_center == nil
           cost_center_name = spreadsheet.cell(i,'AK')
           @cost_center_entry = CostCenter.create(name: cost_center_name)
           cost_center_id = @cost_center_entry.id
        else
        cost_center_id = @cost_center.id
        end
        welfare = spreadsheet.cell(i,'AL')
         if welfare == "Yes"
           welfare = true
         else
           welfare = false
         end
         contact_library = spreadsheet.cell(i,'AM')
         if contact_library == "Yes"
           contact_library = true
         else
           contact_library = false
         end
        gps_track = spreadsheet.cell(i,'AN')
        restricted_area = spreadsheet.cell(i,'AO')

        @employee_prsent = JoiningDetail.find_by(employee_id: employee_id)
        if @employee_prsent.nil?
        @joining_detail = JoiningDetail.create(employee_id: employee_id,employee_uan_no: employee_uan_no,
          joining_date: joining_date,confirmation_date: confirmation_date,employee_grade_id: employee_grade_id,
          employee_designation_id: employee_designation_id,employee_category_id: employee_category_id,
          probation_period: probation_period,notice_period: notice_period,have_passport: have_passport,
          passport_no: passport_no,passport_issue_date: passport_issue_date,passport_expiry_date: passport_expiry_date,
          leaving_date: leaving_date,payment_mode_id: payment_mode_id,basis_of_time: basis_of_time,is_employeer_pf: is_employeer_pf,
          select_pf: select_pf,pf_max_amount: pf_max_amount,employee_pf_no: employee_pf_no,
          is_employeer_esic: is_employeer_esic,have_esic: have_esic,employee_efic_no: employee_efic_no,
          have_retention: have_retention,is_insurance: is_insurance,is_family_pension: is_family_pension,
          is_bonus: is_bonus,ot_option: ot_option,ot_rate: ot_rate,cost_center_id: cost_center_id,
          welfare: welfare,contact_library: contact_library,gps_track: gps_track,restricted_area: restricted_area,
          contract_month: contract_month,contract_end_date: contract_end_date)
        else
        @employee_prsent.update(employee_id: employee_id,employee_uan_no: employee_uan_no,c_off: c_off,
          joining_date: joining_date,confirmation_date: confirmation_date,employee_grade_id: employee_grade_id,
          employee_designation_id: employee_designation_id,employee_category_id: employee_category_id,
          probation_period: probation_period,notice_period: notice_period,have_passport: have_passport,
          passport_no: passport_no,passport_issue_date: passport_issue_date,passport_expiry_date: passport_expiry_date,
          leaving_date: leaving_date,payment_mode_id: payment_mode_id,basis_of_time: basis_of_time,is_employeer_pf: is_employeer_pf,
          select_pf: select_pf,pf_max_amount: pf_max_amount,employee_pf_no: employee_pf_no,
          is_employeer_esic: is_employeer_esic,have_esic: have_esic,employee_efic_no: employee_efic_no,
          have_retention: have_retention,is_insurance: is_insurance,is_family_pension: is_family_pension,
          is_bonus: is_bonus,ot_option: ot_option,ot_rate: ot_rate,cost_center_id: cost_center_id,
          welfare: welfare,contact_library: contact_library,gps_track: gps_track,restricted_area: restricted_area,
          contract_month: contract_month,contract_end_date: contract_end_date,retirement_date:retirement_date)
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
