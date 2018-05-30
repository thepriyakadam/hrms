class AddColumnToJoiningDetails < ActiveRecord::Migration
  def change
    remove_column :joining_details, :c_off_applicable_day, :decimal
    add_column :joining_details, :c_off_applicable_day, :decimal, default: 0
    add_column :joining_details, :c_off_expire, :boolean
     add_column :joining_details, :contract_month, :string
    add_column :joining_details, :contract_end_date, :date
  end
end
