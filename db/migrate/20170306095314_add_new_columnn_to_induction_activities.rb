class AddNewColumnnToInductionActivities < ActiveRecord::Migration
  def change
  	add_column :induction_activities, :is_confirm, :boolean
  end
end
