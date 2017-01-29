class CreateTrainingRequests < ActiveRecord::Migration
  def change
    create_table :training_requests do |t|
      t.references :employee, index: true, foreign_key: true
      t.string :training_topic
      t.string :training_period
      t.date :training_date
      t.references :reporting_master, index: true, foreign_key: true
      t.text :description

      t.timestamps null: false
    end
  end
end
