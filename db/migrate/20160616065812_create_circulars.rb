class CreateCirculars < ActiveRecord::Migration
  def change
    create_table :circulars do |t|
      t.date :date
      t.string :subject
      t.boolean :is_active
      t.boolean :is_confirm
      t.string  :email
      t.boolean :send_email

      t.timestamps null: false
    end
  end
end
