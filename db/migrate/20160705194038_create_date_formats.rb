class CreateDateFormats < ActiveRecord::Migration
  def change
    create_table :date_formats do |t|
      t.string :name
      t.string :value

      t.timestamps null: false
    end
  end
end
