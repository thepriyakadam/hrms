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
      @salaryslips = Salaryslip.where(month: "February").limit(10)
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
   

  @salaryslips = Salaryslip.where(month: "February").limit(10)

    @salaryslips.each do |e|
      s = SalaryComponent.find(12)
      # e = SalaryComponent.find(13)
      # f = SalaryComponent.find(15)
      # i = SalaryComponent.find(14)
      # o = SalaryComponent.find(16)
      # p = SalaryComponent.find(17)
      # so = SalaryComponent.find(18)
      # sl = SalaryComponent.find(19)
      # r = SalaryComponent.find(20)
      # w = SalaryComponent.find(22)
      # m = SalaryComponent.find(23)

      sc = SalaryComponent.new
      # sc = SalaryComponent.where("(name = ? or name = ? or name = ?)","PF","ESIC","Food Deduction")
      # sc = SalaryComponent.all
      # sc = SalaryComponent.where('name LIKE ?','PF')
      sc_1 = SalaryComponent.where(is_deducted:true).first
      sc_2 = SalaryComponent.where(is_deducted:true).second
      sc_3 = SalaryComponent.where(is_deducted:true).third
      sc_4 = SalaryComponent.where(is_deducted:true).fourth
      sc_5 = SalaryComponent.where(is_deducted:true).fifth

      # if sc.try(:name) == "PF"
      #   s = SalaryComponent.where(name: "PF")
      # elsif sc.try(:name) == "ESIC"
      #   p = SalaryComponent.where(name: "ESIC")
      # else
      # end

      # sc_6 = SalaryComponent.where(is_deducted:true).sixth
      # sc_7 = SalaryComponent.where(is_deducted:true).seventh
      # sc_8 = SalaryComponent.where(is_deducted:true).eighth
      # sc_9 = SalaryComponent.where(is_deducted:true).nineth

      # s = SalaryComponent.where(name: "PF")
      # e = SalaryComponent.where(name: "ESIC")
      # f = SalaryComponent.where(name: "Food Deduction")
      # i = SalaryComponent.where(name: "Income Tax")
      # o = SalaryComponent.where(name: "Other Deduction")
      # p = SalaryComponent.where(name: "Prof. Tax")
      # so = SalaryComponent.where(name: "Society")
      # sl = SalaryComponent.where(name: "Society Loan")
      # r = SalaryComponent.where(name: "Retaintion")
      # w = SalaryComponent.where(name: "Welfair")
      # m = SalaryComponent.where(name: "Mobile Deduction")

        deductable_items = SalaryslipComponent.where(is_deducted: true,salary_component_id: nil,salaryslip_id: e.id.to_i)
        deductable_items.each do |d|

          xml.row do
            employee = Employee.find(e.employee_id)
            joining = JoiningDetail.find_by_employee_id(employee.id)
            xml.EmployeeCode employee.manual_employee_code
           
          if sc_1.try(:name).to_s && d.other_component_name.to_s == "PF"
            xml.AccountCode sc_1.account_code
            # xml.Debit d.calculated_amount
            xml.ComponentName d.other_component_name
          elsif sc_2.try(:name).to_s && d.other_component_name.to_s == "ESIC"
             xml.AccountCode sc_2.account_code
             # xml.Debit d.calculated_amount
             xml.ComponentName d.other_component_name
          elsif sc_3.try(:name).to_s && d.other_component_name.to_s == "Food Deduction"
             xml.AccountCode sc_4.account_code
             # xml.Debit d.calculated_amount
             xml.ComponentName d.other_component_name
          # elsif sc_5.try(:name).to_s && d.other_component_name.to_s == "Income Tax"
          #    xml.AccountCode sc_5.account_code
          #    xml.Value d.calculated_amount
          #    xml.OtherComponentName d.other_component_name
          elsif sc_4.try(:name).to_s && d.other_component_name.to_s == "Other Deduction"
             xml.AccountCode sc_4.account_code
             # xml.Value d.calculated_amount
             xml.ComponentName d.other_component_name
          elsif sc_5.try(:name).to_s && d.other_component_name.to_s == "Prof. Tax"
             xml.AccountCode sc_5.account_code
             # xml.Value d.calculated_amount
             xml.ComponentName d.other_component_name
          # elsif sc_6.try(:name).to_s && d.other_component_name.to_s == "Society"
          #    xml.AccountCode sc_6.account_code
          #    xml.Value d.calculated_amount
          #    xml.ComponentName d.other_component_name
          # elsif sc_9.try(:name).to_s && d.other_component_name.to_s == "Society Loan"
          #    xml.AccountCode sc.account_code
          #    xml.Value d.calculated_amount
          #    xml.ComponentName d.other_component_name
          # elsif sc_7.try(:name).to_s && d.other_component_name.to_s == "Retaintion"
          #    xml.AccountCode sc_7.account_code
          #    xml.Value d.calculated_amount
          #    xml.ComponentName d.other_component_name
          # elsif sc_8.try(:name).to_s && d.other_component_name.to_s == "Welfair"
          #    xml.AccountCode sc_8.account_code
          #    xml.Value d.calculated_amount
          #    xml.ComponentName d.other_component_name
          # elsif sc_9.try(:name).to_s && d.other_component_name.to_s == "Mobile Deduction"
          #    xml.AccountCode sc_1.account_code
          #    xml.Value d.calculated_amount
          #    xml.ComponentName d.other_component_name
          else
            # puts "--------------------------------------------"
          end
          
          # if sc.try(:name).to_s && d.other_component_name.to_s == "PF"
          #   xml.AccountCode sc.account_code
          #   # xml.Debit d.calculated_amount
          #   xml.ComponentName d.other_component_name
          # elsif sc.try(:name).to_s && d.other_component_name.to_s == "ESIC"
          #    xml.AccountCode sc.account_code
          #    # xml.Debit d.calculated_amount
          #    xml.ComponentName d.other_component_name
          # else
          # end

          if d.is_deducted == true
            xml.Debit "0"
            xml.Credit d.calculated_amount.round
          else
            xml.Credit "0"
            xml.Debit d.calculated_amount.round
          end
          xml.VatLine "N"
          xml.DueDate Time.now.strftime("%Y%m%d")
          xml.TaxDate Time.now.strftime("%Y%m%d")
          xml.CostingCode joining.cost_center.try(:name)
          xml.CostingCode2 joining.department.try(:name)
        end
      end
    end

      @salaryslips = Salaryslip.where(month: "February").limit(10)
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
