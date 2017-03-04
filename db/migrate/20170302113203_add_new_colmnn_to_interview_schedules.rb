class AddNewColmnnToInterviewSchedules < ActiveRecord::Migration
  def change
  	add_column :interview_schedules, :address, :text
  end
end
