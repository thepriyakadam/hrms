class AddReferenceToInterviewReschedules < ActiveRecord::Migration
  def change
    add_reference :interview_reschedules, :interview_schedule, index: true, foreign_key: true
  end
end
