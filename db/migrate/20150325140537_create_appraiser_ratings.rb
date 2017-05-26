class CreateAppraiserRatings < ActiveRecord::Migration
  def change
    create_table :appraiser_ratings do |t|

      t.timestamps null: false
    end
  end
end
