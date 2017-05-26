class CreateGoalRatings < ActiveRecord::Migration
  def change
    create_table :goal_ratings do |t|
      t.references :goal_bunch, index: true, foreign_key: true
      t.references :period, index: true, foreign_key: true
      t.string :goal_type
      t.references :goal_perspective, index: true, foreign_key: true
      t.references :attribute_master, index: true, foreign_key: true
     
      t.integer :goal_weightage
      t.text :goal_measure
      t.text :target
      t.string :aligned

      t.references :goal_setter
      t.references :appraisee
      t.text :appraisee_comment

      t.references :appraiser
      t.text :appraiser_comment
      t.references :appraiser_rating
      
      t.references :reviewer
      t.text :reviewer_comment
      
      t.references :performance_calendar, index: true, foreign_key: true
      t.references :training_topic_master, index: true, foreign_key: true
      t.boolean :is_assigned
      t.boolean :is_hide
      t.timestamps null: false
    end
  end
end
