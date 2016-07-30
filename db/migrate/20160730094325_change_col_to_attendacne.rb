class ChangeColToAttendacne < ActiveRecord::Migration
  def change
  	change_column :employee_attendances, :is_confirm, :boolean, default: false
  end
end