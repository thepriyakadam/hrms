class CreatePreOnboardings < ActiveRecord::Migration
  def change
    create_table :pre_onboardings do |t|
      t.references :selected_resume, index: true, foreign_key: true
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.date :birth_date
      t.string :gender
      t.string :marital_status
      t.string :fathers_name
      t.string :nationality
      t.text :permanent_address
      t.string :city
      t.references :country, index: true, foreign_key: true
      t.references :state, index: true, foreign_key: true
      t.references :district, index: true, foreign_key: true
      t.string :pin_code
      t.text :current_address
      t.string :contact_no
      t.string :optional_no
      t.string :email
      t.string :pan_no
      t.string :adhar_no

      t.timestamps null: false
    end
  end
end
