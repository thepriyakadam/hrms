class EmployeeTemplate < ActiveRecord::Base
  belongs_to :employee
  belongs_to :salary_template
  has_many :employee_salary_templates
  # validates :employee_id, uniqueness: { scope: [:is_active] }
  # validates :employee_id, uniqueness: { scope: [:is_active] }

  validates :employee_id, uniqueness: { scope: [:salary_template_id] }
  def self.create_object(employee_id, template_id)
    employee_template = EmployeeTemplate.new do |et|
      et.employee_id = employee_id
      et.salary_template_id = template_id
      et.is_active = true
      et.start_date = Date.today
    end
    employee_template
  end

  def self.build_objects(arrays, params, employee_id, template_id, employee_template)
    arrays.each do |a|
      salary_component = SalaryComponent.find(params[:salary_component_id][a])
      next if salary_component.name == 'CTC'
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

  def self.filter_records(current_user)
    @employee_templates =  if current_user.class == Group
      EmployeeTemplate.all
    elsif current_user.class == Member
      if current_user.role.name == "GroupAdmin"
        @employees = Employee.where(company_id: current_user.company_id)
        EmployeeTemplate.where(employee_id: @employees)
      elsif current_user.role.name == "Admin"
        @employees = Employee.where(company_location_id: current_user.company_id)
        EmployeeTemplate.where(employee_id: @employees)
      elsif current_user.role.name == "Branch"
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        EmployeeTemplate.where(employee_id: @employees)
      elsif current_user.role.name == "HOD"
        @employees = Employee.where(department_id: current_user.department_id)
        EmployeeTemplate.where(employee_id: @employees)
      elsif current_user.role.name == "Employee"
        EmployeeTemplate.where(employee_id: current_user.employee_id)
      end
    end
  end

  def self.create_new_object(employee_id, template_id)
    employee_template = EmployeeTemplate.new do |et|
      et.employee_id = employee_id
      et.salary_template_id = template_id
      et.is_active = false
      # et.start_date = Date.today
    end
    employee_template
  end
end
