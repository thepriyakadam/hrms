class CreateTravelOptions < ActiveRecord::Migration
  def change
    create_table :travel_options do |t|
      t.string :code
      t.string :name
      t.text :discription

      t.timestamps null: false
    end
  end
end
