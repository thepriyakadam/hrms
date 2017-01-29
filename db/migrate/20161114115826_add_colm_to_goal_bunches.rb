class AddColmToGoalBunches < ActiveRecord::Migration
  def change
  	remove_column :goal_bunches, :appraisee_rating, :string
  	 add_column :goal_bunches, :appraisee_rating_id, :string
  end
end
