class CreateEmployeeLeavBalances < ActiveRecord::Migration
  def change
    create_table :employee_leav_balances do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :leav_category, index: true, foreign_key: true
      t.string :no_of_leave
      t.date :expiry_date
      t.string :total_leave
      t.boolean :is_confirm
      t.date :from_date
      t.date :to_date
      t.boolean :is_active
      t.timestamps null: false
    end
  end
end
