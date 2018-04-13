class CreateEventDetails < ActiveRecord::Migration
  def change
    create_table :event_details do |t|
      t.date :date
      t.string :name
      t.text :description
      t.boolean :status

      t.timestamps null: false
    end
  end
end
