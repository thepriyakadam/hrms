class CreateReviewers < ActiveRecord::Migration
  def change
    create_table :reviewers do |t|

      t.timestamps null: false
    end
  end
end
