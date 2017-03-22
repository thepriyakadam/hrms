class ChangeDatatypeInterviewDecisions < ActiveRecord::Migration
  def change
  	change_column :interview_decisions, :name, :integer
  end
end
