class CreateTransferHistories < ActiveRecord::Migration
  def change
    create_table :transfer_histories do |t|
      t.references :employee_transfer, index: true, foreign_key: true
      t.references :employee, index: true, foreign_key: true
      t.references :reporting_master
      t.references :employee_designation, index: true, foreign_key: true
      t.references :employee_category, index: true, foreign_key: true
      t.references :company, index: true, foreign_key: true
      t.references :company_location, index: true, foreign_key: true
      t.references :department, index: true, foreign_key: true
      t.string :designation
      t.string :category
      t.string :employee_company
      t.string :employee_company_location
      t.string :employee_department
      t.string :current_status
      t.text :justification

      t.timestamps null: false
    end
  end
end
