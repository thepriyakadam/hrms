class AddReffToInterviewSchedules < ActiveRecord::Migration
  def change
    add_reference :interview_schedules, :selected_resume, index: true, foreign_key: true
  end
end
