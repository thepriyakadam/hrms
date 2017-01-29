class AddColToLeavCOff < ActiveRecord::Migration
  def change
    add_column :leave_c_offs, :is_taken, :boolean, default: false
    add_column :leave_c_offs, :expiry_date, :date
  end
end
