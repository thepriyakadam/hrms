class AddNewColumToMachineAttendances < ActiveRecord::Migration
  def change
    add_reference :machine_attendances, :user, index: true, foreign_key: true
    add_column :machine_attendances, :is_updated, :boolean
  end
end
