class AddRefToInterviewReschedules < ActiveRecord::Migration
  def change
    add_reference :interview_reschedules, :employee, index: true, foreign_key: true
  end
end
