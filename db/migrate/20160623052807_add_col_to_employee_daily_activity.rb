class AddColToEmployeeDailyActivity < ActiveRecord::Migration
  def change
    add_column :employee_daily_activities, :day, :date
  end
end
