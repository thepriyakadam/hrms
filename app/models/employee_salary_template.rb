class EmployeeSalaryTemplate < ActiveRecord::Base
  scope :deducted, -> { where(is_deducted: true) }
  scope :addable, -> { where(is_deducted: false) }
  belongs_to :employee
  belongs_to :salary_template
  belongs_to :salary_component
  belongs_to :parent_salary_component, class_name: 'SalaryComponent'
  belongs_to :employee_template
  #validates_uniqueness_of :salary_template_id, :scope => :employee_id
  # validates :employee_id, uniqueness: { scope: [:salary_template_id, :salary_component_id] }

  def self.collect_salary_objects(emp_id)
    @employee = Employee.find_by_manual_employee_code(emp_id)
    if @employee.nil?
      @flag = false
    else
      @addable_salary_components = EmployeeSalaryTemplate.where('employee_id = ? and is_deducted = ?', @employee.id, false)
      @deducted_salary_components = EmployeeSalaryTemplate.where('employee_id = ? and is_deducted = ?', @employee.id, true)
      unless params['month'].nil? && params['year'].nil?
        @working_day = Workingday.where('employee_id = ? and month_name = ? and year = ?', @employee.id, params['month'], params['year']).take
      end

      unless @addable_salary_components.nil?
        @addable_total = @addable_salary_components.sum('monthly_amount').to_f
        unless @addable_total.nil?
          if @working_day.nil?
            @absent_value = 0
          else
            @absent_value = ((@addable_total / @working_day.try(:day_in_month)) * @working_day.try(:absent_day)).to_f
          end

          if @absent_value.nil?
            @deducted_total = @deducted_salary_components.sum('monthly_amount').to_f
          else
            @deducted_total = (@deducted_salary_components.sum('monthly_amount') + @absent_value).to_f
          end
        end
      end

      @advance_salary = AdvanceSalary.find_by_employee_id(@employee.id)
      unless @advance_salary.nil?
        @instalments = @advance_salary.instalments
        @instalment_array = []
        @instalments.each do |i|
          if i.try(:instalment_date).strftime('%B') == params['month'] && i.try(:instalment_date).strftime('%Y') == params['year']
            @instalment_array << i
          end
        end
      end
      @flag = true
    end
  end
end
