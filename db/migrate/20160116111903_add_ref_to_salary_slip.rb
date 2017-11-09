class AddRefToSalarySlip < ActiveRecord::Migration
  def change
    add_reference :salaryslips, :salary_template, index: true, foreign_key: true
    add_column :salaryslip_components, :other_component_name, :string
  end
end
