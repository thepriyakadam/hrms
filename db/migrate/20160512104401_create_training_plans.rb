class CreateTrainingPlans < ActiveRecord::Migration
  def change
    create_table :training_plans do |t|
      t.date :training_date
      t.string :topic
      t.string :no_of_employee
      t.string :trainer_name
      t.string :no_of_days
      t.string :no_of_hrs
      t.string :place

      t.timestamps null: false
    end
  end
end
