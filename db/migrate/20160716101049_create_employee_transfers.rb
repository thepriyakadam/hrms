class CreateEmployeeTransfers < ActiveRecord::Migration
  def change
    create_table :employee_transfers do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :reporting_master, index: true, foreign_key: true
      t.references :employee_designation, index: true, foreign_key: true
      t.references :employee_category, index: true, foreign_key: true
      t.references :company, index: true, foreign_key: true
      t.references :company_location, index: true, foreign_key: true
      t.references :department, index: true, foreign_key: true

      t.string :current_status
      t.text :justification

      t.timestamps null: false
    end
  end
end
