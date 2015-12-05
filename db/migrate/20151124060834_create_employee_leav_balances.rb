class CreateEmployeeLeavBalances < ActiveRecord::Migration
  def change
    create_table :employee_leav_balances do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :leav_category, index: true, foreign_key: true
      t.references :company_leav, index: true, foreign_key: true
      t.string :no_of_leave

      t.timestamps null: false
    end
  end
end
