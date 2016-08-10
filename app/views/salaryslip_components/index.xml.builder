xml.instruct!
xml.BOM do
  xml.BO do
    xml.AdmInfo do
      xml.Object 30
      xml.Version 2
    end
    xml.JournalEntries do
      xml.row do
        xml.ReferenceDate  
        xml.TaxDate Time.now.strftime("%Y%m%d")
        xml.VatDate Time.now.strftime("%Y%m%d")
        xml.DueDate Time.now.strftime("%Y%m%d")
      end
    end
    @maps.each do |m|
      @salary_components = SalaryslipComponent.where(salary_component_id: m.salary_component_id).limit(1)
      # @salary_components = SalaryslipComponent.where(salary_component_id: m.salary_component_id)
      xml.JournalEntries_Lines
        @salary_components.each do |c|
          xml.row do
            employee = Employee.find(c.salaryslip.employee_id)
            joining = JoiningDetail.find_by_employee_id(employee.id)
            xml.EmployeeCode employee.manual_employee_code
            xml.AccountCode m.account_code
            xml.ComponentName m.salary_component.try(:name)
            xml.CalculatedNetSalary c.salaryslip.calculated_net_salary.round
            # xml.SalarySlipDate c.salaryslip.month_year

            if c.is_deducted
              xml.Credit c.calculated_amount.round
              xml.Debit "0"
            else
              xml.Credit "0"
              xml.Debit c.calculated_amount.round
            end
            xml.VatLine "N"
            xml.DueDate Time.now.strftime("%Y%m%d")
            xml.TaxDate Time.now.strftime("%Y%m%d")

            xml.CostingCentre joining.cost_center.try(:name)
            xml.DepartmentName joining.department.try(:name)
        end
      end
    end
  end
end