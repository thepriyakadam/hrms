class AddRefToInterviewSchedules < ActiveRecord::Migration
  def change
    add_reference :interview_schedules, :reporting_master, index: true, foreign_key: true
    add_column :interview_schedules, :email_id, :string
  end
end
