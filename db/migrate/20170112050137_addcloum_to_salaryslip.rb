class AddcloumToSalaryslip < ActiveRecord::Migration
  def change
  	add_column :salaryslips, :is_confirm, :boolean
  end
end
