class AddColumnToEmployee < ActiveRecord::Migration
  def change
  	add_column :employees, :optional_email, :string
  	add_column :joining_details, :company_rfid, :string
  	add_column :joining_details, :gate_rfid, :string
  end
end
