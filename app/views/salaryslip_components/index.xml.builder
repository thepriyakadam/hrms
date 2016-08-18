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
      # @salary_components = SalaryslipComponent.where("salary_component_id = ? or (other_component_name = ? or other_component_name = ? or other_component_name = ?)",m.salary_component_id,"ESIC","PF","Food Deduction").limit(1)
      # @salaryslip_components = SalaryslipComponent.where(is_deducted: true , salary_component_id: s.salary_component_id)
      @salaryslips = Salaryslip.where(month: "February")
      @salaryslips.each do |e|
        @salaryslip_components = SalaryslipComponent.where(is_deducted: true ,salary_component_id: s.id,salaryslip_id: e.id.to_i)
      # @c1 = SalaryslipComponent.where(salary_component_id: s.id)
      # @salaryslips = Salaryslip.where(id: @c1.salaryslip_id)
      # @salaryslip_month = Salaryslip.where(id: @salaryslips.id,month: "January")
      # @salaryslip_components = SalaryslipComponent.where(salaryslip_id: @salaryslip_month.id,salary_component_id: s.id)

      # @salaryslip_components = Salaryslip.joins(:salaryslip_components).where(salaryslip.month = "January")
             # @salaryslip_components =Salaryslip.joins(:salaryslip_components).where(['month = ?', 'January'])

        @salaryslip_components.each do |c|
          xml.row do
            employee = Employee.find(c.salaryslip.employee_id)
            joining = JoiningDetail.find_by_employee_id(employee.id)
            xml.EmployeeCode employee.manual_employee_code
            xml.AccountCode s.account_code
            xml.ComponentName s.try(:name)
            xml.Month c.salaryslip.month
            xml.Year c.salaryslip.year
            xml.Value c.calculated_amount.round
            # xml.OtherComponent c.other_component_name
            xml.row do
           

            if c.is_deducted == true
              xml.dfsdfddf c.calculated_amount.round
              xml.Value c.calculated_amount.round
              # xml.OtherComponent c.other_component_name
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
       xml.CalculatedNetSalary c.salaryslip.calculated_net_salary.round
    end
   end
  end
end
end

 
  
        sc = SalaryComponent.new
            deductable_items = SalaryslipComponent.where(is_deducted: true, is_arrear: nil,salary_component_id: nil,salaryslip_id: 5244)
            deductable_items.each do |d|
            xml.row do
            # employee = Employee.find(c.salaryslip.employee_id)
            # joining = JoiningDetail.find_by_employee_id(employee.id)
            # xml.EmployeeCode employee.manual_employee_code
            # xml.AccountCode m.account_code
            # xml.ComponentName m.salary_component.try(:name)
            # xml.AccountCode m.account_code
            # xml.Month c.salaryslip.month
            # xml.Year c.salaryslip.year

            # # case d.other_component_name
            # #   when "PF" && sc.try(:name)d.calculated_amount.to_i

              
            # #   when "ESIC"
            # #   d.calculated_amount.to_i
            # #   when "Income Tax"
            # #   sr.income_tax = d.calculated_amount
            # #   when "Prof. Tax"
            # #   sr.pt = d.calculated_amount
            # #   when "Advance"
            # #   sr.advance = d.calculated_amount.to_i
            # #   when "Society"
            # #   sr.society = d.calculated_amount
            # #   when "Food Deduction"
            # #   sr.food_deduction = d.calculated_amount.to_i
            # #   when "Mobile Deduction"
            # #   sr.mobile = d.calculated_amount
            # #   when "Retention"
            # #   sr.retention = d.calculated_amount
            # #   when "Well Faire"
            # #   sr.welfair = d.calculated_amount
            # # end

            if sc.try(:name).to_s && d.other_component_name.to_s == "PF"
               xml.Value d.calculated_amount
               xml.OtherComponentName d.other_component_name
               # xml.EmployeeCode employee.manual_employee_code
            elsif sc.try(:name).to_s && d.other_component_name.to_s == "ESIC"
               xml.Value d.calculated_amount
               xml.OtherComponentName d.other_component_name
               # xml.EmployeeCode employee.manual_employee_code
            elsif sc.try(:name).to_s && d.other_component_name.to_s == "Food Deduction"
               xml.Value d.calculated_amount
               xml.OtherComponentName d.other_component_name
            elsif sc.try(:name).to_s && d.other_component_name.to_s == "Income Tax"
               xml.Value d.calculated_amount
               xml.OtherComponentName d.other_component_name
            elsif sc.try(:name).to_s && d.other_component_name.to_s == "Other Deduction"
               xml.Value d.calculated_amount
               xml.OtherComponentName d.other_component_name
            elsif sc.try(:name).to_s && d.other_component_name.to_s == "Prof. Tax"
               xml.Value d.calculated_amount
               xml.OtherComponentName d.other_component_name
            elsif sc.try(:name).to_s && d.other_component_name.to_s == "Society"
               xml.Value d.calculated_amount
               xml.OtherComponentName d.other_component_name
            elsif sc.try(:name).to_s && d.other_component_name.to_s == "Society Loan"
               xml.Value d.calculated_amount
               xml.OtherComponentName d.other_component_name
            elsif sc.try(:name).to_s && d.other_component_name.to_s == "Retaintion"
               xml.Value d.calculated_amount
               xml.OtherComponentName d.other_component_name
            elsif sc.try(:name).to_s && d.other_component_name.to_s == "Welfair"
               xml.Value d.calculated_amount
               xml.OtherComponentName d.other_component_name
            elsif sc.try(:name).to_s && d.other_component_name.to_s == "Mobile Deduction"
               xml.Value d.calculated_amount
               xml.OtherComponentName d.other_component_name

               # xml.EmployeeCode employee.manual_employee_code
            # elsif sc.try(:name) && c.other_component_name == "PF"
            #    xml.Value c. calculated_amount
            # elsif sc.try(:name) && c.other_component_name == "PF"
            #    xml.Value c. calculated_amount
            else
              # puts "--------------------------------------------"
            end
          end

  end
end
