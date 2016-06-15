xml.instruct!
xml.components do
  @salaryslip_components.each do |component|
    xml.component do
      xml.employee_code component.salaryslip.employee.manual_employee_code
      unless component.salary_component.nil?
      	xml.salary_component component.salary_component.name
      else
      	xml.salary_component component.other_component_name
      end
      xml.actual_amount component.actual_amount
      xml.calculated_amount component.calculated_amount
      xml.credit component.calculated_amount
      xml.debit "0"
    end
  end
end