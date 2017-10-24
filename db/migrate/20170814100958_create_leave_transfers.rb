class CreateLeaveTransfers < ActiveRecord::Migration
  def change
    create_table :leave_transfers do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :transfer_to
      t.date :date
      t.string :no_of_leave
      t.string :status
      t.text :reason
      t.references :employee_leav_balance, index: true, foreign_key: true
      t.references :leav_category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
