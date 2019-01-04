class CreateEmployeeWeekOffs < ActiveRecord::Migration
  def change
    create_table :employee_week_offs do |t|
      t.references :week_off_master, index: true, foreign_key: true
      t.references :employee, index: true, foreign_key: true
      t.string :day
      t.date :date
      t.boolean :status
      t.boolean :is_confirm

      t.timestamps null: false
    end
  end
end
