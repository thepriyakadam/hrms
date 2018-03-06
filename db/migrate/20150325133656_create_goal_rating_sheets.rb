class CreateGoalRatingSheets < ActiveRecord::Migration
  def change
    create_table :goal_rating_sheets do |t|

      t.timestamps null: false
    end
  end
end
