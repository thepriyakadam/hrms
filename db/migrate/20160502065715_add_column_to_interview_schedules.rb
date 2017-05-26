class AddColumnToInterviewSchedules < ActiveRecord::Migration
  def change
    add_column :interview_schedules, :is_confirm, :boolean
  end
end
