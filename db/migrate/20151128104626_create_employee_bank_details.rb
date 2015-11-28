class CreateEmployeeBankDetails < ActiveRecord::Migration
  def change
    create_table :employee_bank_details do |t|
      t.references :employee, index: true, foreign_key: true
      t.string :account_no
      t.string :bank_name
      t.string :branch_name
      t.string :address
      t.string :contact_no
      t.string :micr_code
      t.string :branch_code
      t.string :ifsc_code

      t.timestamps null: false
    end
  end
end
