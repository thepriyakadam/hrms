class AddNewColumnToTrainingPlans < ActiveRecord::Migration
  def change
    add_column :training_plans, :trainer_email, :string
  end
end
