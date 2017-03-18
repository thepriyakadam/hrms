class AddNewColomnToInterviewRounds < ActiveRecord::Migration
  def change
    add_column :interview_rounds, :is_confirm, :boolean
  end
end
