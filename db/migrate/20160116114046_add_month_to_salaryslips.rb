class AddMonthToSalaryslips < ActiveRecord::Migration
  def change
    add_column :salaryslips, :month, :string
    add_column :salaryslips, :year, :string
  end
end
