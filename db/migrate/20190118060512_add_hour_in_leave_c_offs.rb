class AddHourInLeaveCOffs < ActiveRecord::Migration
  def change
    add_column :leave_c_offs, :in_time, :time
    add_column :leave_c_offs, :out_time, :time
    add_column :leave_c_offs, :total_working_hrs, :string
  end
end
