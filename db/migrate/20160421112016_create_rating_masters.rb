class CreateRatingMasters < ActiveRecord::Migration
  def change
    create_table :rating_masters do |t|
      t.integer :code
      t.text :description

      t.timestamps null: false
    end
  end
end
