class AddRefToSalarySlip < ActiveRecord::Migration
  def change
  	add_reference :salaryslips, :salary_template, index: true, foreign_key: true
  	remove_column :salaryslips, :template_id
  	add_column :salaryslip_components, :other_component_name, :string
  end
end
