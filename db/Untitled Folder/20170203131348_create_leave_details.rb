class CreateLeaveDetails < ActiveRecord::Migration
  def change
    create_table :leave_details do |t|
      t.references :salaryslip, index: true, foreign_key: true
      t.references :leav_category, index: true, foreign_key: true
      t.string :no_of_leave
      t.decimal :balance

      t.timestamps null: false
    end
  end
end
