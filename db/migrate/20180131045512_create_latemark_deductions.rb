class CreateLatemarkDeductions < ActiveRecord::Migration
  def change
    create_table :latemark_deductions do |t|
      t.references :employee, index: true, foreign_key: true
      t.date :latemark_day
      t.string :latemark_count
      t.decimal :latemark_amount

      t.timestamps null: false
    end
  end
end
