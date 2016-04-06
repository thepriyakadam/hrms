class AddEmpRefToInterviewSchedules < ActiveRecord::Migration
  def change
    add_reference :interview_schedules, :employee, index: true, foreign_key: true
  end
end
