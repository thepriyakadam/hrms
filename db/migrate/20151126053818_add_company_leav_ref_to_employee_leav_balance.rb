class AddCompanyLeavRefToEmployeeLeavBalance < ActiveRecord::Migration
  def change
    add_reference :employee_leav_balances, :company_leav, index: true, foreign_key: true
  end
end
