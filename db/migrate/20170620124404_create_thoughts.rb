class CreateThoughts < ActiveRecord::Migration
  def change
    create_table :thoughts do |t|
      t.date :date
      t.text :thought
      t.string :thought_of

      t.timestamps null: false
    end
  end
end
