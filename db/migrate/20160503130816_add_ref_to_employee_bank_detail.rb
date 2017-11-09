class AddRefToEmployeeBankDetail < ActiveRecord::Migration
  def change
    add_reference :employee_bank_details, :bank, index: true, foreign_key: true
  end
end
