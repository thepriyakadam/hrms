class CreateGoalRatings < ActiveRecord::Migration
  def change
    create_table :goal_ratings do |t|
      t.references :goal_bunch, index: true, foreign_key: true
      t.references :goal_perspective, index: true, foreign_key: true

      t.references :period, index: true, foreign_key: true
     
      t.integer :goal_weightage
      t.string :goal_measure
      t.text :target
      t.string :aligned
      t.references :goal_setter, index: true, foreign_key: true
      t.references :appraisee, index: true, foreign_key: true
      t.text :appraisee_comment
      t.references :appraiser, index: true, foreign_key: true
      t.text :appraiser_comment
      t.references :appraiser_rating, index: true, foreign_key: true
      t.references :reviewer, index: true, foreign_key: true
      t.text :reviewer_comment
      t.references :attribute, index: true, foreign_key: true
      t.references :attribute_master, index: true, foreign_key: true
      t.string :goal_type
      t.references :performance_calendar, index: true, foreign_key: true
      t.references :training_topic_master, index: true, foreign_key: true
      t.boolean :is_assigned
      t.boolean :is_hide
      t.timestamps null: false
    end
  end
end
