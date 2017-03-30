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

end
