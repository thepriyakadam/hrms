class CreateMonthlyIncomeTaxes < ActiveRecord::Migration
  def change
    create_table :monthly_income_taxes do |t|
      t.date :date
      t.decimal :tax_deposited, precision: 5, scale: 2
      t.string :bsr_code
      t.string :challan_no
      t.string :status

      t.timestamps null: false
    end
  end
end
