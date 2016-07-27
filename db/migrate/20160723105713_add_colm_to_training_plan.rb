class AddColmToTrainingPlan < ActiveRecord::Migration
  def change
    add_column :training_plans, :trainer_num, :string
    add_column :training_plans, :about_trainer, :text
  end
end
