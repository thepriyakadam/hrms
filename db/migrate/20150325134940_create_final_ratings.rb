class CreateFinalRatings < ActiveRecord::Migration
  def change
    create_table :final_ratings do |t|

      t.timestamps null: false
    end
  end
end
