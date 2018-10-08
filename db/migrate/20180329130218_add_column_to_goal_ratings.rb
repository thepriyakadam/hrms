class AddColumnToGoalRatings < ActiveRecord::Migration
  def change
    add_column :goal_ratings, :document_present, :string
  end
end
