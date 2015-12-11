class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name
      t.references :country, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
  add_reference :companies, :state, index: true, foreign_key: true
  add_reference :company_locations, :state, index: true, foreign_key: true
  add_reference :employees, :state, index: true, foreign_key: true
  add_reference :families, :state, index: true, foreign_key: true
end
