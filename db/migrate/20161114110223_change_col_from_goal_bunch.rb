class ChangeColFromGoalBunch < ActiveRecord::Migration
  def change
    remove_column :goal_bunches, :appraisee_rating_id, :integer
    add_column :goal_bunches, :appraisee_rating, :string
  end
end
