class CreateTexableMonthlyDeductions < ActiveRecord::Migration
  def change
<<<<<<< HEAD
    # create_table :texable_monthly_deductions do |t|

    #   # t.references :employee, index: true, foreign_key: true
    #   # t.references :salayslip, index: true, foreign_key: true
    #   t.decimal :texable_deducted_amount

    #   t.timestamps null: false
    # end
=======
    create_table :texable_monthly_deductions do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :salaryslip, index: true, foreign_key: true
      t.decimal :texable_deducted_amount

      t.timestamps null: false
>>>>>>> a8f8847a1fda371c240f465f01a89915c4b16f8d
    end
  end
end

