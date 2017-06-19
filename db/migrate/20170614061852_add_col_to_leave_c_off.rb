class AddColToLeaveCOff < ActiveRecord::Migration
  def change
    add_column :leave_c_offs, :taken_date, :date
  end
end
