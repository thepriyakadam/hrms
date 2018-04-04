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
		@salary_map_saps.each do |s|
			 @salaryslips.each do |e|
				@salaryslip_components = SalaryslipComponent.where(salary_component_id: s.salary_component_id,salaryslip_id: e.id.to_i)
				@salaryslip_components.each do |c|
					xml.row do
						employee = Employee.find(c.salaryslip.employee_id)
						joining = JoiningDetail.find_by_employee_id(employee.try(:id))
						xml.EmployeeCode employee.try(:manual_employee_code)
						xml.AccountCode s.account_code
						xml.ComponentName s.salary_component.try(:name)
							if c.is_deducted == true
								xml.Credit c.calculated_amount.round
								xml.Debit "0"
								# xml.Deducted_ComponentName c.salary_component.try(:name)
								# xml.EmployeeCode employee.try(:manual_employee_code)
								# xml.AccountCode s.account_code
								# xml.ComponentName c.salary_component.try(:name)
							else
								xml.Credit "0"
								xml.Debit c.calculated_amount.round
								# xml.EmployeeCode employee.try(:manual_employee_code)
								# xml.AccountCode s.account_code
								# xml.ComponentName c.salary_component.try(:name)
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
		
		@salary_comp = SalaryComponent.find_by(name: "Net Salary")
		@salary_map_sap_1=SalaryMapSap.where(salary_component_id: @salary_comp.id)
		@salary_map_sap_1.each do |s|
			@salaryslips.each do |e|
					xml.row do
						employee = Employee.find(e.employee_id)
						joining = JoiningDetail.find_by_employee_id(employee.try(:id))
						xml.EmployeeCode employee.try(:manual_employee_code)
						xml.AccountCode s.account_code
						xml.ComponentName s.salary_component.try(:name)
							if s.salary_component.is_deducted == true 
								xml.Credit e.calculated_net_salary.round
								xml.Debit "0"
							else
								xml.Credit "0"
								xml.Debit e.calculated_net_salary.round
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
