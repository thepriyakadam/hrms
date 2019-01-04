class CreateCompanyEvents < ActiveRecord::Migration
  def change
    create_table :company_events do |t|
      t.text :event_name
      t.date :event_date
      t.string :location
      t.boolean :status
      t.string :time
      t.text :description
      t.string :email
      t.boolean :send_email

      t.timestamps null: false
    end
  end
end
