class CreateCompanyLocations < ActiveRecord::Migration
  def change
    create_table :company_locations do |t|
      t.references :company, index: true, foreign_key: true
      t.string :location_code
      t.string :name
      t.string :email
      t.string :address
      t.string :city
      t.string :district
      t.integer :pin_code
      t.string :contact_no

      t.timestamps null: false
    end
    add_reference :members, :company_location, index: true, foreign_key: true
  end
end
