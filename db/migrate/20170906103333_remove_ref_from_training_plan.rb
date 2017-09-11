class RemoveRefFromTrainingPlan < ActiveRecord::Migration
  def change
    remove_reference :training_plans, :training_request, index: true, foreign_key: true
    add_reference :training_plans, :training_request, index: true, foreign_key: true
  end
end
