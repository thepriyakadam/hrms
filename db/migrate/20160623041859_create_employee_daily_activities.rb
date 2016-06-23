class CreateEmployeeDailyActivities < ActiveRecord::Migration
  def change
    create_table :employee_daily_activities do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :project_master, index: true, foreign_key: true
      t.text :today_activity
      t.text :tomorrow_plan

      t.timestamps null: false
    end
  end
end
