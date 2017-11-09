class AddNewColumnToInterviewAnalyses < ActiveRecord::Migration
  def change
    add_reference :interview_analyses, :interview_round, index: true, foreign_key: true
  end
end
