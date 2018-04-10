class CreateEventGalleries < ActiveRecord::Migration
  def change
    create_table :event_galleries do |t|
      t.references :event_detail, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
