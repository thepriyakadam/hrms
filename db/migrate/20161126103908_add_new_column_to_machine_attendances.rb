class AddNewColumnToMachineAttendances < ActiveRecord::Migration
  def change
    add_column :machine_attendances, :is_proceed, :boolean
  end
end
