class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.references :employee, index: true, foreign_key: true
      t.string :no_of_member
      t.string :f_name
      t.string :m_name
      t.string :m_name
      t.string :l_name
      t.date :date_of_birth
      t.integer :age
      t.string :contact_no
      t.string :phone_no
      t.string :email
      t.text :permanent_address
      t.string :city
      t.string :dist
      t.string :state
      t.integer :pin_code
      t.text :current_address
      t.string :relation
      t.string :adhar_no
      t.string :pan_no
      t.string :passport_no
      t.string :medical_claim
      t.string :marital
      t.string :status
      t.references :nationality, index: true, foreign_key: true
      t.string :blood_group
      t.string :religion
      t.string :phandicap
      t.string :profession

      t.timestamps null: false
    end
  end
end
