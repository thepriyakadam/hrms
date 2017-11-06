class CreateTrainingRecords < ActiveRecord::Migration
  def change
    create_table :training_records do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :training_topic_master, index: true, foreign_key: true
      t.date :training_date
      t.string :duration
      t.string :location
      t.string :trainer_name

      t.timestamps null: false
    end
  end
end
