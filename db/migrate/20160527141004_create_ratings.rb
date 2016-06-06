class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.string :value
      t.text :discription

      t.timestamps null: false
    end
  end
end
