class CreateLeaveCashables < ActiveRecord::Migration
  def change
    create_table :leave_cashables do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :leav_category, index: true, foreign_key: true
      t.date :date
      t.string :no_of_leave
      t.string :cashable
      t.decimal :amount
      t.boolean :is_confirm

      t.timestamps null: false
    end
  end
end
