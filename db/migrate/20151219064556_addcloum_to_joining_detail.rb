class AddcloumToJoiningDetail < ActiveRecord::Migration
  def change
    add_column :joining_details, :employee_uan_no, :string
    add_column :joining_details, :employee_pf_no, :string
    add_column :joining_details, :employee_efic_no, :string
  end
end
