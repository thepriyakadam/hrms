class CreateProfessionalTaxes < ActiveRecord::Migration
  def change
    create_table :professional_taxes do |t|
      t.string :is_pt
      t.decimal :min_salary, precision: 15, scale: 2, default: 0
      t.decimal :max_salary, precision: 15, scale: 2, default: 0
      t.decimal :pt_amount, precision: 15, scale: 2, default: 0
      t.decimal :for_months, precision: 15, scale: 2, default: 0
      t.decimal :march_month, precision: 15, scale: 2, default: 0
      t.boolean :is_confirm

      t.timestamps null: false
    end
  end
end
