class AddColumnToJoiningDetail < ActiveRecord::Migration
  def change
    add_column :joining_details, :select_pf, :string
    add_column :joining_details, :pf_max_amount, :string
    add_column :joining_details, :have_esic, :boolean
    add_column :joining_details, :payment_mode, :string
    add_reference :joining_details, :cost_center, index: true, foreign_key: true
    add_reference :joining_details, :employee_category, index: true, foreign_key: true
  end
end
