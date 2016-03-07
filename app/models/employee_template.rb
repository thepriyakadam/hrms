class EmployeeTemplate < ActiveRecord::Base
  belongs_to :employee
  belongs_to :salary_template
  has_many :employee_salary_templates
  #validates :employee_id, uniqueness: { scope: [:is_active] }
  #validates :employee_id, uniqueness: { scope: [:is_active] }

  def self.create_object(employee_id, template_id)
    employee_template = EmployeeTemplate.new do |et|
      et.employee_id = employee_id
      et.salary_template_id = template_id
      et.is_active = true
      et.start_date = Date.today
    end
    employee_template
  end

  def self.build_objects(arrays,params,employee_id,template_id,employee_template)
    arrays.each do |a|
      employee_template.employee_salary_templates.build(employee_id: employee_id, \
                                  salary_template_id: template_id, \
                                  salary_component_id: params[:salary_component_id][a], \
                                  is_deducted: params[:is_deducted][a], \
                                  parent_salary_component_id: params[:parent_salary_component_id][a], \
                                  percentage: params[:percentage][a], \
                                  to_be_paid: params[:to_be_paid][a], \
                                  monthly_amount: params[:monthly_amount][a], \
                                  annual_amount: params[:annual_amount][a])
    end
    employee_template
  end

  def self.create_new_object(employee_id,template_id)
    employee_template = EmployeeTemplate.new do |et|
      et.employee_id = employee_id
      et.salary_template_id = template_id
      et.is_active = false
      #et.start_date = Date.today
    end
    employee_template
  end

  def self.cnt
    begin
      puts EmployeeTemplate.count
      puts EmployeeSalaryTemplate.count
      puts EmployeeArrear.count
      puts EmployeeArrearItem.count
    end
  end
end
