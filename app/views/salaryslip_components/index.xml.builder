xml.instruct!
xml.BOM do
  xml.BO do
    xml.AdmInfo do
      xml.Object 30
      xml.Version 2
    end
    xml.JournalEntries do
      xml.row do
        xml.ReferenceDate Date.today
        xml.TaxDate Date.today
        xml.VatDate Date.today
        xml.DueDate Date.today
      end
    end
    @maps.each do |m|
      @salary_components = SalaryslipComponent.where(salary_component_id: m.salary_component_id).limit(3)
      xml.JournalEntries_Lines do
        @salary_components.each do |c|
          xml.row do
            employee = Employee.find(c.salaryslip.employee_id)
            joining = JoiningDetail.find_by_employee_id(employee.id)
            xml.CostingCode2 employee.manual_employee_code
            xml.AccountCode m.account_code

            if c.is_deducted
              xml.Credit c.calculated_amount
              xml.Debit "0"
            else
              xml.Credit "0"
              xml.Debit c.calculated_amount
            end
            xml.VatLine "N"
            xml.DueDate Date.today
            xml.TaxDate Date.today

            xml.CostingCode joining.cost_center.name
          end
        end
      end  
    end
  end    
end