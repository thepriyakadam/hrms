class CreateTrainingTopicMasters < ActiveRecord::Migration
  def change
    create_table :training_topic_masters do |t|
      t.string :code
      t.string :name
      t.text :description
      t.boolean :status
      t.boolean :is_confirm

      t.timestamps null: false
    end
  end
end