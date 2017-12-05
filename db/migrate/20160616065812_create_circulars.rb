class CreateCirculars < ActiveRecord::Migration
  def change
    create_table :circulars do |t|
      t.date :date
      t.string :subject
      t.string :email
      t.boolean :is_active
      t.boolean :is_confirm

      t.timestamps null: false
    end
  end
end
