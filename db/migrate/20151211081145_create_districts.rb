class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.string :name
      t.references :state, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
  add_reference :companies, :district, index: true, foreign_key: true
  add_reference :company_locations, :district, index: true, foreign_key: true
  add_reference :employees, :district, index: true, foreign_key: true
  add_reference :families, :district, index: true, foreign_key: true

  add_column :countries, :code, :string
  add_column :states, :code, :string
  add_column :districts, :code, :string
end
