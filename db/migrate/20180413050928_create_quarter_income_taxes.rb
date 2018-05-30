class CreateQuarterIncomeTaxes < ActiveRecord::Migration
  def change
    create_table :quarter_income_taxes do |t|
      t.date :date
      t.string :quarter
      t.string :reciept_no
      t.decimal :paid_amount, precision: 5, scale: 2
      t.decimal :tax_amount_deducted, precision: 5, scale: 2
      t.decimal :tax_amount_deposited, precision: 5, scale: 2

      t.timestamps null: false
    end
  end
end
