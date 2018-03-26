class CreateAccidentImages < ActiveRecord::Migration
  def change
    create_table :accident_images do |t|
      t.references :accident_record, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
