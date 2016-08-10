xml.instruct!
xml.BOM do
  xml.BO do
    xml.AdmInfo do
      xml.Object 30
      xml.Version 2
    end
    xml.JournalEntries do
      xml.row do
        xml.ReferenceDate Time.now.strftime("%Y%m%d")
        xml.TaxDate Time.now.strftime("%Y%m%d")
        xml.VatDate Time.now.strftime("%Y%m%d")
        xml.DueDate Time.now.strftime("%Y%m%d")
        xml.TransactionCode
        xml.Series 17
      end
    end
    xml.JournalEntriesLines do
    @maps.each do |m|
      @salary_components = SalaryslipComponent.where(salary_component_id: m.salary_component_id).limit(1)
      # @salary_components = SalaryslipComponent.where(salary_component_id: m.salary_component_id)
        @salary_components.each do |c|
          xml.row do
            employee = Employee.find(c.salaryslip.employee_id)
            joining = JoiningDetail.find_by_employee_id(employee.id)
            xml.EmployeeCode employee.manual_employee_code
            xml.AccountCode m.account_code
            xml.ComponentName m.salary_component.try(:name)
            xml.CalculatedNetSalary c.salaryslip.calculated_net_salary.round
            xml.row do
            if c.is_deducted
            xml.OtherComponent c.other_component_name
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

            xml.CostingCode joining.cost_center.try(:name)
            xml.CostingCode2 joining.department.try(:name)
        end
      end
    end
  end
end
end
end