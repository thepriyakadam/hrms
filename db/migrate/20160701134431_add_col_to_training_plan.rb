class AddColToTrainingPlan < ActiveRecord::Migration
  def change
    add_reference :training_plans, :period, index: true, foreign_key: true
  end
end
