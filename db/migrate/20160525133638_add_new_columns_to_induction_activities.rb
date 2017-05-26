class AddNewColumnsToInductionActivities < ActiveRecord::Migration
  def change
    add_column :induction_activities, :start_date, :date
    add_column :induction_activities, :induction_completed, :boolean
  end
end
