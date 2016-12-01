class AddNewColmnnToMachineAttendances < ActiveRecord::Migration
  def change
    add_column :machine_attendances, :present, :string
  end
end
