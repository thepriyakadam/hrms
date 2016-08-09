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
    Employee.all.each do |employee|
      @addable_items = SalaryslipComponent.where('is_deducted = ? and employee_id = ?', false, employee.id).where(is_arrear: nil)
      @deducted_items = SalaryslipComponent.where('is_deducted = ? and employee_id = ?', true, employee.id).where(is_arrear: nil)
      xml.Employee do
        xml.Name employee.first_name
        xml.JournalEntries_Lines do
          @addable_items.each do |ai|
            
          end
        end
      end
    end
  end
end