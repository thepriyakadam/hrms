class RemoveColumnFromInterviewSchedules < ActiveRecord::Migration
  def change
    remove_column :interview_schedules, :schedule_comments, :text
  end
end
