class AddRefToTrainingPlans < ActiveRecord::Migration
  def change
    add_reference :training_plans, :training_topic_master, index: true, foreign_key: true
  end
end
