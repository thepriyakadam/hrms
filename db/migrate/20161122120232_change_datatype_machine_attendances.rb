class ChangeDatatypeMachineAttendances < ActiveRecord::Migration
  def change
  	change_column :machine_attendances, :in, :datetime
  	change_column :machine_attendances, :out, :datetime
  end
end
