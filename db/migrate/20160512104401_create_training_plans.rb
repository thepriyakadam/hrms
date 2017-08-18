class CreateTrainingPlans < ActiveRecord::Migration
  def change
    create_table :training_plans do |t|
      t.date :training_date
      t.string :no_of_employee
      t.string :trainer_name
      t.string :no_of_days
      t.string :no_of_hrs
      t.string :place
      t.references :training_topic_master, index: true, foreign_key: true
      t.references :training_request, index: true, foreign_key: true
      t.string :trainer_num
      t.text :about_trainer

      t.references :period, index: true, foreign_key: true

      t.string :trainer_email

      t.timestamps null: false
    end
  end
end
