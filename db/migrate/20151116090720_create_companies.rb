class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.references :group, index: true, foreign_key: true
      t.string :manual_company_code
      t.string :company_code
      t.text :description
      t.string :name
      t.references :company_type, index: true, foreign_key: true
      t.string :registration_no
      t.string :pan_card_no
      t.string :tax_no
      t.string :professional_tax_no
      t.text :address
      t.references :country, index: true, foreign_key: true
      t.references :state, index: true, foreign_key: true
      t.references :district, index: true, foreign_key: true
      t.string :city
      t.integer :pin_code
      t.string :email
      t.string :contact_no
      t.string :web_site
      t.date :starting_date

      t.timestamps null: false
    end
    add_reference :members, :company, index: true, foreign_key: true
  end
end
