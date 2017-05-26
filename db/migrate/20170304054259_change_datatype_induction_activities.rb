class ChangeDatatypeInductionActivities < ActiveRecord::Migration
  def change
  	change_column :induction_activities, :duration, :string
  end
end
