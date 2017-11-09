class CreateCirculars < ActiveRecord::Migration
  def change
    create_table :circulars do |t|
      t.date :date
      t.string :subject

      t.timestamps null: false
    end
  end
end
