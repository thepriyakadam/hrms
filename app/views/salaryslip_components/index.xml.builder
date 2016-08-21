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
    @salary_components.each do |s|
      @salaryslips = Salaryslip.where(month: "September")
        
       @salaryslips.each do |e|
        @salaryslip_components = SalaryslipComponent.where(salary_component_id: s.id,salaryslip_id: e.id.to_i)
        @salaryslip_components.each do |c|
          xml.row do
            employee = Employee.find(c.salaryslip.employee_id)
            joining = JoiningDetail.find_by_employee_id(employee.id)
            xml.EmployeeCode employee.manual_employee_code
            xml.AccountCode s.account_code
            xml.ComponentName s.try(:name)
              if c.is_deducted == true
                xml.Value c.calculated_amount.round
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
    
        
   

      @salaryslips = Salaryslip.where(month: "September")
      @salaryslips.each do |e|
          xml.row do
            employee = Employee.find(e.employee_id)
            joining = JoiningDetail.find_by_employee_id(employee.id)
            xml.EmployeeCode employee.manual_employee_code
            xml.AccountCode "120004"
            xml.ComponentName "Net Salary"
            xml.Debit "0"
            xml.Credit e.calculated_net_salary.round
      
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
