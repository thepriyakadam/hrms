class CreateReviewerRatings < ActiveRecord::Migration
  def change
    create_table :reviewer_ratings do |t|

      t.timestamps null: false
    end
  end
end
