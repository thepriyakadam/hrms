class AddReferenceToTrainingPlan < ActiveRecord::Migration
  def change
    add_reference :training_plans, :training_request, index: true, foreign_key: true
  end
end
