class EmployeeArrear < ActiveRecord::Base
  belongs_to :employee
  has_many :employee_arrear_items
  validates :employee_id, uniqueness: { scope: [:is_paid] }

  def self.create_object(employee_id, increement_date)
    employee_arrear = EmployeeArrear.new do |ea|
      ea.employee_id = employee_id
      ea.start_date = increement_date
    end
    employee_arrear
  end

  def self.build_objects(arrears_array, params, employee_arrear)
    arrears_array.each do |aa|
      salary_component = SalaryComponent.find(params[:old_salary_component_id][aa])
      unless salary_component.name == 'CTC'
        employee_arrear.employee_arrear_items.build(salary_component_id: params[:old_salary_component_id][aa], actual_amount: params[:difference][aa], is_deducted: params[:old_is_deducted][aa])
      end
    end
    employee_arrear
  end
end
