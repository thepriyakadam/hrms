class AddNewColmnToInductionActivity < ActiveRecord::Migration
  def change
  	add_column :induction_activities, :facilitator_1, :text
  	add_column :induction_activities, :facilitator_2, :text
  end
end
