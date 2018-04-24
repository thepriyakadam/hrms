class CreateReportingEmployeeTransfers < ActiveRecord::Migration
  def change
    create_table :reporting_employee_transfers do |t|
      t.references :employee_transfer, index: true, foreign_key: true
      t.references :reporting_master
      t.string :status

      t.timestamps null: false
    end
  end
end
