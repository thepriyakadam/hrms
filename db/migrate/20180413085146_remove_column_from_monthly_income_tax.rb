class RemoveColumnFromMonthlyIncomeTax < ActiveRecord::Migration
  def change
    remove_column :monthly_income_taxes, :tax_deposited, precision: 5, scale: 2
    add_column :monthly_income_taxes, :tax_deposited, :decimal
  end
end
