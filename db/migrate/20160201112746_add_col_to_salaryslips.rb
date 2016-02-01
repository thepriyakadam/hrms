class AddColToSalaryslips < ActiveRecord::Migration
  def change
    add_column :salaryslips, :month_year, :date
  end
end
