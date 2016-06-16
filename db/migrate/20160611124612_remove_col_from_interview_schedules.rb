class RemoveColFromInterviewSchedules < ActiveRecord::Migration
  def change
  	remove_column :interview_schedules, :reporting_master_id, :integer
  	remove_column :interview_schedules, :interview_time, :interview_time
  	remove_column :interview_schedules, :interview_type, :string
  	remove_column :interview_schedules, :schedule_comment, :text
  	remove_column :interview_schedules, :interview_status, :integer
  	remove_column :interview_schedules, :candidate_name2, :string
  	remove_column :interview_schedules, :interviewer_name, :string
  	add_column :interview_schedules, :job_title, :string
  end
end
