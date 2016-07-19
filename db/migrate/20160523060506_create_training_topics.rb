class CreateTrainingTopics < ActiveRecord::Migration
  def change
    create_table :training_topics do |t|
      t.string :code
      t.string :name
      t.text :description
      t.boolean :status

      t.timestamps null: false
    end
  end
end
