class RemoveColumnFromQuarterIncomeTax < ActiveRecord::Migration
  def change
    remove_column :quarter_income_taxes, :paid_amount, precision: 5, scale: 2
    remove_column :quarter_income_taxes, :tax_amount_deducted, precision: 5, scale: 2
    remove_column :quarter_income_taxes, :tax_amount_deposited, precision: 5, scale: 2
    add_column :quarter_income_taxes, :paid_amount, :decimal
    add_column :quarter_income_taxes, :tax_amount_deducted, :decimal
    add_column :quarter_income_taxes, :tax_amount_deposited, :decimal
  end
end
