class AddRefToInterviewAnalyses < ActiveRecord::Migration
  def change
    add_reference :interview_analyses, :interview_schedule, index: true, foreign_key: true
  end
end
