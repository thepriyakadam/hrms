class AddColToSalaryslipComponents < ActiveRecord::Migration
  def change
    add_column :salaryslip_components, :other_component_name, :string
  end
end
