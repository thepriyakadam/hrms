class AddNewColumnToInterviewSchedules < ActiveRecord::Migration
  def change
    add_column :interview_schedules, :candidate_name2, :string
  end
end
