class AddColmToGoalBunches < ActiveRecord::Migration
  def change
  	 add_column :goal_bunches, :appraisee_rating_id, :string
  end
end
