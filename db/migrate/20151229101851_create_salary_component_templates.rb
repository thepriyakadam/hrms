class CreateSalaryComponentTemplates < ActiveRecord::Migration
  def change
    create_table :salary_component_templates do |t|
      t.string :manual_template_code
      t.references :salary_template, index: true, foreign_key: true
      t.references :salary_component, index: true, foreign_key: true
      t.boolean :is_deducted
      t.references :parent_salary_component
      t.decimal :percentage, precision: 4, scale: 2
      t.boolean :is_taxable
      t.decimal :tax, precision: 4, scale: 2
      t.string :base
      t.string :to_be_paid
      t.decimal :max_amount, precision: 15, scale: 2
      t.decimal :monthly_amount, precision: 15, scale: 2
      t.decimal :annual_amount, precision: 15, scale: 2
      t.references :parent
      t.timestamps null: false
    end
  end
end
