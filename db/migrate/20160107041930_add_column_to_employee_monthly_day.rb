class AddColumnToEmployeeMonthlyDay < ActiveRecord::Migration
  def change
    add_column :employee_monthly_days, :no_of_working_day, :string
  end
end
