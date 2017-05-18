class AddcolToInductionActivities < ActiveRecord::Migration
  def change
  	add_column :induction_activities, :activity_date, :date
  	add_column :induction_activities, :from, :time
  	add_column :induction_activities, :to, :time
  	add_column :induction_activities, :program_agenda, :text
  end
end
