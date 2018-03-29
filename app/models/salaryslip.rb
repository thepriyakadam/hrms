class Salaryslip < ActiveRecord::Base
  protokoll :salary_slip_code, pattern: 'SAL#######'
  belongs_to :employee
  belongs_to :employee_bank_detail
  belongs_to :workingday
  belongs_to :salary_template
  belongs_to :cost_center
  has_many :salaryslip_components
  has_many :leave_details
  has_many :slip_informations
  has_many :texable_monthly_deductions
  validates :employee_id, uniqueness: { scope: [:workingday_id] }

  # def self.to_text
  #   # attributes = %w{employee_id day in out shift_master_id is_proceed present user_id}
  #   attributes = %w{employee_id employee_name pf_no payable_days basic da total pf}

  #   CSV.generate(:col_sep => "#~#") do |txt|
  #     txt << attributes

  #     all.each do |salaryslip|
  #       txt << attributes.map{ |attr| salaryslip.send(attr) }
  #     end
  #   end
  # end

  # def employee_id
  #      "#{self.employee.try(:manual_employee_code)}"
  # end
  
  # def employee_name
  #     "#{self.employee.try(:first_name)}#{self.employee.try(:middle_name)}#{self.employee.try(:last_name)}"
  # end

  # def pf_no
  #      "#{self.employee.joining_detail.try(:employee_pf_no)}"
  # end

  # def payable_days
  #    "#{self.workingday.try(:payable_day)}"
  # end

  # def basic
  #   @sal_comp = SalaryComponent.find_by(name: "Basic")
  #   @salaryslip_components = SalaryslipComponent.where(salaryslip_id: self.id,salary_component_id: @sal_comp).pluck(:calculated_amount).map {|i| i.to_i}.inject{|n|}
  #   "#{@salaryslip_components}"
  # end

  #  def da
  #   @sal_comp = SalaryComponent.find_by(name: "DA")
  #   @salaryslip_components = SalaryslipComponent.where(salaryslip_id: self.id,salary_component_id: @sal_comp).pluck(:calculated_amount).map {|i| i.to_i}.inject{|n|}
  #   "#{@salaryslip_components}"
  # end


  # def total
  #   @sal_comp_basic = SalaryComponent.find_by(name: "Basic")
  #   @sal_comp_da = SalaryComponent.find_by(name: "DA")
  #   @salaryslip_components_basic = SalaryslipComponent.where(salaryslip_id: self.id,salary_component_id: @sal_comp_basic)
  #   @salaryslip_components_da = SalaryslipComponent.where(salaryslip_id: self.id,salary_component_id: @sal_comp_da)
  #   sum = @salaryslip_components_basic.sum(:calculated_amount) + @salaryslip_components_da.sum(:calculated_amount)
  #   "#{sum.to_f.round}"
  # end

  # def pf
  #   @sal_comp = SalaryComponent.find_by(name: "PF")
  #   @salaryslip_components = SalaryslipComponent.where(salaryslip_id: self.id,salary_component_id: @sal_comp).pluck(:calculated_amount).map {|i| i.to_i}.inject{|n|}
  #   "#{@salaryslip_components}"
  # end

    def self.import(file)
     spreadsheet = open_spreadsheet(file)
    (2..spreadsheet.last_row).each do |i|
        @employee = Employee.find_by_manual_employee_code(spreadsheet.cell(i,'B').to_i)
        if @employee.nil?
        else
        employee_id = @employee.id
        

        @employee_prsent = Salaryslip.find_by(employee_id: employee_id)
        if @employee_prsent.nil?
        @salaryslip = Salaryslip.create(employee_id: employee_id,salary_slip_code: salary_slip_code,month_year: month_year,month: month,year: year,workingday_id: workingday_id,actual_gross_salary: actual_gross_salary,calculated_gross_salary: calculated_gross_salary,actual_total_deduction: actual_total_deduction,
          calculated_total_deduction: calculated_total_deduction,calculated_net_salary: calculated_net_salary,salary_template_id: salary_template_id,other_component_name: other_component_name,employee_template_id: employee_template_id)
        else
        @employee_prsent.update(employee_id: employee_id,salary_slip_code: salary_slip_code,month_year: month_year,month: month,year: year,workingday_id: workingday_id,actual_gross_salary: actual_gross_salary,calculated_gross_salary: calculated_gross_salary,actual_total_deduction: actual_total_deduction,
          calculated_total_deduction: calculated_total_deduction,actual_net_salary: actual_net_salary,calculated_net_salary: calculated_net_salary,salary_template_id: salary_template_id,other_component_name: other_component_name,employee_template_id: employee_template_id)
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

end
